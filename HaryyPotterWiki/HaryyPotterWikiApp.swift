//
//  HaryyPotterWikiApp.swift
//  HaryyPotterWiki
//
//  Created by Filipe Marques on 26/04/25.
//

import SwiftUI

@main
struct HaryyPotterWikiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
