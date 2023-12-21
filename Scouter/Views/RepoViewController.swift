//
//  RepoViewController.swift
//  Scouter
//
//  Created by Akhil on 26/11/23.
//

import Foundation
import SwiftUI
import UIKit

class RepoViewController: UIViewController{
    //MARK: VARIABLES
    var repos:[Repository]?
    var filteredRepos:[Repository]?
    var shouldShowSearchResults = false
    let viewModel = RepoViewModel(apiService: ApiService.shared)
    var searchController:UISearchController = UISearchController()
    var repoLink:String
    init(repoLink: String) {
        self.repoLink = repoLink
        super.init(nibName: nil, bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: UI COMPONENTS
    let refreshControl = UIRefreshControl()
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(RepoTableViewCell.self, forCellReuseIdentifier: RepoTableViewCell.identifier)
        //        table.rowHeight = 300
        table.backgroundColor = UIColor(named: "LaunchScreenBackgroundColor")
        table.tableFooterView = UIView(frame: .zero)
        return table
    }()
    
    private let loader:UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loader.hidesWhenStopped = true
        loader.style = UIActivityIndicatorView.Style.medium
        loader.color = UIColor(named: "Gold")
        loader.startAnimating();
        return loader
    }()
    //MARK: METHODS
    func reloadTable(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    @objc func refresh(_ sender: AnyObject){
        self.loader.startAnimating()
        viewModel.fetchRepos(repoLink: repoLink) { [weak self] data in
            // Update UI with data
            self?.repos = data
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.loader.stopAnimating()
                self?.refreshControl.endRefreshing()
            }
        }
    }
    
    //MARK: LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.tableView.dataSource=self
        self.tableView.delegate=self
        viewModel.fetchRepos(repoLink: repoLink) { [weak self] data in
            // Update UI with data
            self?.repos = data
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.loader.stopAnimating()
            }
        }
    }
    //MARK: SETUP UI
    
    private func setupUI(){
        //        self.view.backgroundColor = UIColor(named: "LaunchScreenBackgroundColor")
        self.view.addSubview(tableView)
        self.view.addSubview(loader)
        self.configureSearchController()
        tableView.allowsSelection = false
        tableView.tableHeaderView = searchController.searchBar
        
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            loader.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}

struct RepoViewControllerRepresentable: UIViewControllerRepresentable {
    let repoLink:String
    
    init(repoLink: String) {
        self.repoLink = repoLink
    }
    
    func makeUIViewController(context: Context) -> RepoViewController {
        return RepoViewController(repoLink: repoLink)
    }
    
    func updateUIViewController(_ uiViewController: RepoViewController, context: Context) {
        // Update the view controller if needed
    }
}
