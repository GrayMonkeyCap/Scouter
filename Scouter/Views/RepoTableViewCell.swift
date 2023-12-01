//
//  RepoTableViewCell.swift
//  Scouter
//
//  Created by Akhil on 26/11/23.
//

import UIKit

class RepoTableViewCell: UITableViewCell {

    static let identifier = "repoCell"
    private var topics:[String]?
    
    let contentContainerView: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor(named: "Grayish")
            view.layer.cornerRadius = 10 // Adjust the corner radius as needed
            view.layer.masksToBounds = true
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    private let name:UILabel = {
        let label = UILabel()
        label.text="trial"
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.textColor = UIColor(.yellow)
        return label
    }()
    
    private let desc:UILabel = {
        let label = UILabel()
        label.text = "description"
        label.textColor = UIColor(.yellow)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let topicStack:UIStackView = {
        let stackView = UIStackView()
            stackView.spacing = 2
            stackView.distribution = .fillProportionally
            stackView.axis = .horizontal
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
    }()
    
    private let topicCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSizeMake(150, 25)
        layout.scrollDirection = .horizontal
        let topicCV = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        topicCV.translatesAutoresizingMaskIntoConstraints = false
        return topicCV
    }()
    
    public func configure(name:String,desc:String,topics:[String]){
        self.name.text = name
        self.desc.text = desc
        self.topics = topics
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    private func setupUI(){
        self.backgroundColor = UIColor(named: "LaunchScreenBackgroundColor")
        self.contentView.addSubview(contentContainerView)
        contentContainerView.addSubview(name)
        contentContainerView.addSubview(desc)
        contentContainerView.addSubview(topicCollectionView)

        topicCollectionView.delegate   = self
        topicCollectionView.dataSource = self
        topicCollectionView.backgroundColor = UIColor(named: "Grayish")
        topicCollectionView.register(TopicCell.self, forCellWithReuseIdentifier: "topicCell")
        name.translatesAutoresizingMaskIntoConstraints = false
        desc.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            contentContainerView.topAnchor.constraint(equalTo: self.contentView.topAnchor,constant: 0),
            contentContainerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,constant: -10),
            contentContainerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,constant: 10),
            contentContainerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,constant: -5),
            name.topAnchor.constraint(equalTo: contentContainerView.topAnchor, constant: 15),
            name.leadingAnchor.constraint(equalTo: contentContainerView.layoutMarginsGuide.leadingAnchor),
            desc.leadingAnchor.constraint(equalTo: contentContainerView.layoutMarginsGuide.leadingAnchor),
            desc.trailingAnchor.constraint(equalTo: contentContainerView.layoutMarginsGuide.trailingAnchor),
            desc.topAnchor.constraint(equalTo: name.bottomAnchor,constant: 10),
            topicCollectionView.topAnchor.constraint(equalTo: desc.bottomAnchor,constant: 10),
            topicCollectionView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            topicCollectionView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            topicCollectionView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            topicCollectionView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RepoTableViewCell:UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topics?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topicCell", for: indexPath as IndexPath) as! TopicCell
        
        cell.cellLabel.text = self.topics?[indexPath.row]
        cell.backgroundColor = UIColor(named: "Gold")
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let topic = self.topics?[indexPath.row]{
            let textSize = topic.size(withAttributes: nil)
            return CGSize(width: textSize.width * 2, height: textSize.height * 2)
        }else{
            return CGSize()
        }
    }
    
}

class TopicCell:UICollectionViewCell{
    override init(frame: CGRect) {
            super.init(frame: frame)
            addViews()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cellLabel:UILabel = {
        let cellLabel = UILabel()
        cellLabel.textColor = UIColor(named: "LaunchScreenBackgroundColor")
        return cellLabel
    }()
    func addViews(){
        self.contentView.addSubview(cellLabel)
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cellLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            cellLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
    }
}

