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
        var dataController:DataController
        @Published var searchedAccount:Account?
        var context:NSManagedObjectContext
        var apiService:ApiServiceProtocol
        init(dataController: DataController, searchedAccount: Account? = nil, apiService: ApiServiceProtocol) {
            self.dataController = dataController
            self.searchedAccount = searchedAccount
            self.context = dataController.container.viewContext
            self.apiService = apiService
        }
        func getAccount(_ userName:String){
            apiService.fetchAccount(userName: userName) { account in
                self.searchedAccount = account
            }
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
