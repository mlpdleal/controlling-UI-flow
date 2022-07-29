//
//  RolldicesApp.swift
//  Rolldices
//
//  Created by Manoel Leal on 29/07/22.
//

import SwiftUI



@main
struct RolldicesApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
