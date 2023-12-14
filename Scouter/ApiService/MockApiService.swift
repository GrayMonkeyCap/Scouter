//
//  MockApiService.swift
//  Scouter
//
//  Created by Akhil on 10/12/23.
//

import Foundation

class MockApiService:ApiServiceProtocol{
    func fetchRepos(repoLink: String, completion: @escaping ([Repository]) -> Void) {
        let repo1 = Repository(name: "Scouter", description: "App to scout talent", fork: false, topics: ["ios","swiftui","uikit"])
        let repo2 = Repository(name: "X", description: "Twitter", fork: true, topics: ["test"])
        
        let repos = [repo1,repo2]
        completion(repos)
    }
    
    
    func fetchAccount(userName: String,completion: @escaping (Account) -> Void){
        let account = Account(login: "tester", avatar_url: "https://avatars.githubusercontent.com/u/78576375?s=40&v=4", url: "vdfv", repos_url: "fgdf", name: "John Watson", bio: "Lorem ipsum dolor sit amet",type: "Organisation",favourite: true)
       completion(account)
    }
    
}
