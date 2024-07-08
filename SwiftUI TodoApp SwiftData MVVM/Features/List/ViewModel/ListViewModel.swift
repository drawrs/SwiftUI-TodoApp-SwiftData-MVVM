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
    
    var tasks: [Task] = []
    
    init(modelContext: ModelContext? = nil) {
        self.modelContext = modelContext
        
        if tasks.isEmpty {
            loadSamples()
        } else {
            fetchTasks()
        }
    }
    
    func fetchTasks() {
        
    }
    
    func searchTask(keyword: String) {
        if keyword.isEmpty {
            fetchTasks()
        } else {
            
        }
    }
    
    func loadSamples() {
        
    }
    
    func delete(task: Task) {
        
    }
    
    func add(title: String, date: Date, priority: Priority, status: Status) {
        let task = Task(title: title, date: date, priority: priority, status: status)
        modelContext?.insert(task)
        
        fetchTasks()
    }
}
