//
//  DataController.swift
//  Scouter
//
//  Created by Akhil on 24/11/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    static let shared = DataController(container: CoreDataContainer(name: "Scouter",inMemory: false))
    let container:CoreDataContainer
    let persistentStoreDescription = NSPersistentStoreDescription()
    init(container:CoreDataContainer) {
        self.container = container
        self.container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
        
    }
    func saveData() {
        do {
            try container.viewContext.save()
            
        } catch let error {
            print("Error: \(error)")
        }
    }
}

public final class CoreDataContainer: NSPersistentContainer {
    public init(name: String, bundle: Bundle = .main, inMemory: Bool = false) {
        guard let mom = NSManagedObjectModel.mergedModel(from: [bundle]) else {
            fatalError("Failed to create mom")
        }
        super.init(name: name, managedObjectModel: mom)
        configureDefaults(inMemory)
    }
    
    private func configureDefaults(_ inMemory: Bool = false) {
        if let storeDescription = persistentStoreDescriptions.first {
            storeDescription.shouldAddStoreAsynchronously = true
            if inMemory {
                storeDescription.url = URL(fileURLWithPath: "/dev/null")
                storeDescription.shouldAddStoreAsynchronously = false
            }
        }
    }
}
