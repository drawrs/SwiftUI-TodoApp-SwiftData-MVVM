//
//  AddTask.swift
//  SwiftUI TodoApp SwiftData MVVM
//
//  Created by Rizal Hilman on 08/07/24.
//

import SwiftUI

struct AddTaskView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State var title: String = ""
    @State private var date: Date = Date.now
    @State var priority: Priority = .low
    @State var status: Status = .todo
    
    var body: some View {
        Form {
            
            Section {
                HStack {
                    TextField("Task..", text: $title)
                }
                
                DatePicker("Date", selection: $date, displayedComponents: .date)
                
                Picker("Priority", selection: $priority) {
                    ForEach(Priority.allCases, id: \.self) { priority in
                        Text(priority.rawValue).tag(priority)
                    }
                }
                .pickerStyle(.menu)
                
                Picker("Status", selection: $status) {
                    ForEach(Status.allCases, id: \.self) { status in
                        Text(status.rawValue.capitalized).tag(status)
                    }
                }
                .pickerStyle(.menu)
            }
        }
        .navigationTitle("Add new task")
        .toolbarTitleDisplayMode(.inline)
        .toolbar(content: {
            Button(action: {
                save()
            }, label: {
                Text("Save")
            })
        })
    }
    
    func save() {
        dismiss()
    }
    
}

#Preview {
    NavigationStack {
        AddTaskView()
    }
}
