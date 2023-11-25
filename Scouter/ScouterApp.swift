//
//  ScouterApp.swift
//  Scouter
//
//  Created by Akhil on 11/11/23.
//

import SwiftUI

@main
struct ScouterApp: App {
    @StateObject private var dataController = DataController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
