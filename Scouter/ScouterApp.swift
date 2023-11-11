//
//  ScouterApp.swift
//  Scouter
//
//  Created by Akhil on 11/11/23.
//

import SwiftUI

@main
struct ScouterApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
