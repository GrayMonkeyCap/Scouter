//
//  Accounts+CoreDataProperties.swift
//  Scouter
//
//  Created by Akhil on 14/12/23.
//
//

import Foundation
import CoreData


extension Accounts {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Accounts> {
        return NSFetchRequest<Accounts>(entityName: "Accounts")
    }
    
    @NSManaged public var avatar_url: String?
    @NSManaged public var bio: String?
    @NSManaged public var favourite: Bool
    @NSManaged public var login: String?
    @NSManaged public var name: String?
    @NSManaged public var repos_url: String?
    @NSManaged public var type: String?
    @NSManaged public var url: String?
    @NSManaged public var tag: Tags?
    
    public var wrappedName:String {
        name ?? "No Name"
    }
}
