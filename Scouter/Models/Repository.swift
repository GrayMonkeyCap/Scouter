//
//  Repository.swift
//  Scouter
//
//  Created by Akhil on 26/11/23.
//

import Foundation

struct Repository:Codable{
    let name:String
    let description:String?
    let fork:Bool
    let topics:[String]
    enum CodingKeys : String, CodingKey {
            case name
            case description
            case fork
            case topics
        }
}

