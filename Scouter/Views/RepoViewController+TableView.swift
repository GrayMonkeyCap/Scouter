//
//  RepoViewController+TableView.swift
//  Scouter
//
//  Created by Akhil on 30/11/23.
//

import Foundation
import UIKit

extension RepoViewController: UITableViewDelegate, UITableViewDataSource {
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: RepoTableViewCell.identifier) as! RepoTableViewCell
//       cell.name.text = repos?[indexPath.row].name ?? "lol"
       if shouldShowSearchResults {
           cell.configure(name: filteredRepos?[indexPath.row].name ?? "name",desc: filteredRepos?[indexPath.row].description ?? "No Description", topics: filteredRepos?[indexPath.row].topics ?? [])
       } else {
           cell.configure(name: repos?[indexPath.row].name ?? "name",desc: repos?[indexPath.row].description ?? "No Description", topics: repos?[indexPath.row].topics ?? [])
       }
       
      return cell
}
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       if shouldShowSearchResults {
           return filteredRepos?.count ?? 0
       } else {
           return repos?.count ?? 0
       }
   }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
