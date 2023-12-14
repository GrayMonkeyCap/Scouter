//
//  RepoViewModel.swift
//  Scouter
//
//  Created by Akhil on 26/11/23.
//

import Foundation

extension RepoViewController{
    class RepoViewModel{
        
        var apiService : ApiServiceProtocol

        init(apiService: ApiServiceProtocol) {
            self.apiService = apiService
        }
        func fetchRepos(repoLink: String, completion: @escaping ([Repository])->Void) {
            apiService.fetchRepos(repoLink: repoLink) { data in
                completion(data)
            }
        }
    }
}
