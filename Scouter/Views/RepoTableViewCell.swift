//
//  RepoTableViewCell.swift
//  Scouter
//
//  Created by Akhil on 26/11/23.
//

import UIKit

class RepoTableViewCell: UITableViewCell {

    static let identifier = "repoCell"
    private let name:UILabel = {
        let label = UILabel()
        label.text="trial"
        return label
    }()
    
    private let desc:UILabel = {
        let label = UILabel()
        label.text = "description"
        return label
    }()
    
    public func configure(name:String,desc:String){
        self.name.text = name
        self.desc.text = desc
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    private func setupUI(){
        self.contentView.addSubview(name)
        self.contentView.addSubview(desc)
        name.translatesAutoresizingMaskIntoConstraints = false
        desc.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
//            name.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            name.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            desc.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            desc.topAnchor.constraint(equalTo: name.bottomAnchor,constant: 20)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
