//
//  ApiService.swift
//  Scouter
//
//  Created by Akhil on 10/12/23.
//

import Foundation
protocol ApiServiceProtocol{
    func fetchAccount(userName: String,completion: @escaping (Account)->Void)
    func fetchRepos(repoLink:String,completion: @escaping ([Repository]) -> Void)
}
class ApiService:ApiServiceProtocol{
    static let shared = ApiService()
    func fetchAccount(userName: String,completion: @escaping (Account)->Void){
        let url = URL(string: "https://api.github.com/users/\(userName)")!
        var account:Account?
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do{
                account = try decoder.decode(Account.self, from: data)
                completion(account!)
                
            }catch{
                print(error)
            }
            
        }
        task.resume()
    }
    func fetchRepos(repoLink:String,completion: @escaping ([Repository]) -> Void){
        
        let url = URL(string: repoLink)!
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do{
                let repos = try decoder.decode([Repository].self, from: data)
                completion(repos)
            }catch{
                print(error)
            }
            
        }
        task.resume()
    }
    
    
}
