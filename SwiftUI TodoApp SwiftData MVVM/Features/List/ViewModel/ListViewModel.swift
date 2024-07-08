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
        
        fetchTasks()
        
        if tasks.isEmpty {
            loadSamples()
        }
    }
    
    func fetchTasks() {
        do {
            let descriptor = FetchDescriptor<Task>(sortBy: [SortDescriptor(\.timestamps, order: .reverse)])
            self.tasks = try modelContext?.fetch(descriptor) ?? []
        } catch {
            print("Fetch failed")
        }
    }
    
    func searchTask(keyword: String) {
        if keyword.isEmpty {
            fetchTasks()
        } else {
            do {
                let descriptor = FetchDescriptor<Task>(predicate: #Predicate<Task> { task in
                    task.title.contains(keyword)
                }, sortBy: [SortDescriptor(\.date, order: .reverse)])
                
                self.tasks = try modelContext?.fetch(descriptor) ?? []
            } catch {
                print("Failed to search.. ", error.localizedDescription)
            }
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
        
        print("Added")
    }
}
