//
//  DataController.swift
//  Scouter
//
//  Created by Akhil on 24/11/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    static let shared = DataController()
    let container = NSPersistentContainer(name: "Scouter")
    
    init() {
        container.loadPersistentStores { description, error in
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
