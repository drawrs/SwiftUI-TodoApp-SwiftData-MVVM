//
//  ListViewModel.swift
//  SwiftUI TodoApp SwiftData MVVM
//
//  Created by Rizal Hilman on 08/07/24.
//

import Foundation
import SwiftData

@Observable
class ListViewModel {
    
    var modelContext: ModelContext?
    
    init(modelContext: ModelContext? = nil) {
        self.modelContext = modelContext
    }
}
