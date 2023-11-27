//
//  RepoViewModel.swift
//  Scouter
//
//  Created by Akhil on 26/11/23.
//

import Foundation

extension RepoViewController{
    class RepoViewModel{
        func fetchRepos(repoLink:String,completion: @escaping ([Repository]) -> Void){
            
                let url = URL(string: repoLink)!
                
                let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                    guard let data = data else { return }
                    let decoder = JSONDecoder()
                    do{
                        var repos = try decoder.decode([Repository].self, from: data)
                        completion(repos)
                    }catch{
                        print(error)
                    }
                    
                }
                task.resume()
                }
        }
}
