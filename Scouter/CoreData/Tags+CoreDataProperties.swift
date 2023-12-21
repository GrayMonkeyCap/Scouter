//
//  Tags+CoreDataProperties.swift
//  Scouter
//
//  Created by Akhil on 14/12/23.
//
//

import Foundation
import CoreData


extension Tags {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tags> {
        return NSFetchRequest<Tags>(entityName: "Tags")
    }
    
    @NSManaged public var tagName: String?
    @NSManaged public var account: NSSet?
    
    public var wrappedTagName:String {
        tagName ?? "unknown Tag"
    }
    public var accountList:Set<Accounts> {
        let accounts = account as? Set<Accounts> ?? []
        return accounts
    }
}

// MARK: Generated accessors for account
extension Tags {
    
    @objc(addAccountObject:)
    @NSManaged public func addToAccount(_ value: Accounts)
    
    @objc(removeAccountObject:)
    @NSManaged public func removeFromAccount(_ value: Accounts)
    
    @objc(addAccount:)
    @NSManaged public func addToAccount(_ values: NSSet)
    
    @objc(removeAccount:)
    @NSManaged public func removeFromAccount(_ values: NSSet)
    
}

extension Tags : Identifiable {
    
}
