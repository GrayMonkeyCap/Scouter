//
//  SearchViewModel.swift
//  Scouter
//
//  Created by Akhil on 14/11/23.
//

import Foundation
import CoreData

extension SearchUserView{
    class SearchViewModel:ObservableObject{
        let dataController = DataController.shared
        @Published var searchedAccount:Account?
        var context = DataController.shared.container.viewContext
        
        
        func addData(dataToSave: String) {
            
        }
        
        func getAccount(_ userName:String){
            let url = URL(string: "https://api.github.com/users/\(userName)")!
            
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                guard let data = data else { return }
                let decoder = JSONDecoder()
                print(String(data: data, encoding: .utf8)!)
                do{
                    self.searchedAccount = try decoder.decode(Account.self, from: data)
                    
                }catch{
                    print(error)
                }
                
            }
            
            task.resume()
        }
        
            func saveAccount(){
                if let account = searchedAccount{
                    let newAccount = Accounts(context: context)
                    newAccount.name = account.name
                    newAccount.avatar_url = account.avatar_url
                    newAccount.bio = account.bio
                    newAccount.login = account.login
                    newAccount.repos_url = account.repos_url
                    newAccount.type = account.type
                    newAccount.url = account.url
                    newAccount.favourite = false
                    dataController.saveData()
                }
            }
        
        
        
    }
}
