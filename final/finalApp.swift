//
//  finalApp.swift
//  final
//
//  Created by baccoucheyessin on 26/11/2022.
//

import SwiftUI

 @main
struct finalApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
           Start()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
