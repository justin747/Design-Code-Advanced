//
//  Design_Code_AdvancedApp.swift
//  Design+Code Advanced
//
//  Created by Justin747 on 11/5/21.
//

import SwiftUI
import Firebase

@main
struct Design_Code_AdvancedApp: App {
    let persistenceController = PersistenceController.shared
    
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
