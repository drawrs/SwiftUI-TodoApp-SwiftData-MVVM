//
//  SwiftUI_TodoApp_SwiftData_MVVMApp.swift
//  SwiftUI TodoApp SwiftData MVVM
//
//  Created by Rizal Hilman on 08/07/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftUI_TodoApp_SwiftData_MVVMApp: App {
    var sharedModelContainer: ModelContainer = {
        
        let schema = Schema([
            Task.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
        }
        .modelContainer(sharedModelContainer)
    }
}
