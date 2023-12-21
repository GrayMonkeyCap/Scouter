//
//  RepoViewController+Search.swift
//  Scouter
//
//  Created by Akhil on 30/11/23.
//

import Foundation
import UIKit
extension RepoViewController:UISearchBarDelegate,UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchString = searchController.searchBar.text
        filteredRepos = repos?.filter({ (repo) -> Bool in
            let repoName: NSString = repo.name as NSString
            return (repoName.range(of: searchString!, options: .caseInsensitive).location) != NSNotFound
        })
        reloadTable()
    }
    public func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        shouldShowSearchResults = true
        self.reloadTable()
    }
    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        shouldShowSearchResults = false
        self.reloadTable()
    }
    func configureSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search here..."
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.sizeToFit()
        searchController.searchBar.barTintColor = UIColor(named: "LaunchScreenBackgroundColor")
        searchController.searchBar.tintColor = UIColor(.yellow)
        searchController.searchBar.setTextColor(UIColor(named: "Gold")!)
        searchController.searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search Repository", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "Gold")!])
        searchController.searchBar.searchTextField.leftView?.tintColor = UIColor(named: "Gold")
    }
}

extension UISearchBar {
    func setTextColor(_ color: UIColor) {
        let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = color
    }
}
