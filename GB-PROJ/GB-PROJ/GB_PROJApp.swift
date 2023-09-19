//
//  GB_PROJApp.swift
//  GB-PROJ
//
//  Created by Егор  Хлямов on 19.09.2023.
//

import SwiftUI

@main
struct GB_PROJApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
