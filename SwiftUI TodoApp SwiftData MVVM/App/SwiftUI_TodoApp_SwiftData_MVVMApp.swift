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
   
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
        }
    }
}
