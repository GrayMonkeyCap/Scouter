//
//  Account.swift
//  Scouter
//
//  Created by Akhil on 14/11/23.
//

import Foundation

struct Account:Codable,Equatable{
    let login:String
    let avatar_url:String
    let url:String
    let repos_url:String
    let name:String?
    let bio:String?
    let type:String
    var favourite:Bool = false
    private enum CodingKeys: String, CodingKey {
        case login,avatar_url,url,repos_url,name,bio,type
    }
}
