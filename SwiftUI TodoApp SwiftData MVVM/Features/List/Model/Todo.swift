//
//  Todo.swift
//  SwiftUI TodoApp SwiftData MVVM
//
//  Created by Rizal Hilman on 08/07/24.
//

import Foundation
import SwiftData

enum Priority: Codable {
    case low
    case medium
    case high
}

enum Status: Codable {
    case done
    case todo
}

@Model
final class Task {
    var title: String
    var date: Date
    var timestamps: Date
    var priority: Priority
    var status: Status
    
    init(title: String, date: Date = .init(), priority: Priority, status: Status = .todo) {
        self.title = title
        self.date = date
        self.timestamps = Date.now
        self.priority = priority
        self.status = status
    }
}
