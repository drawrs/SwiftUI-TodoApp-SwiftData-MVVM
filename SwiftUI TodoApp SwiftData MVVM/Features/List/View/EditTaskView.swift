//
//  AddTask.swift
//  SwiftUI TodoApp SwiftData MVVM
//
//  Created by Rizal Hilman on 08/07/24.
//

import SwiftUI

struct EditTaskView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @Binding var viewModel: ListViewModel
    
    @State var task: Task
    
    var body: some View {
        Form {
            Section {
                HStack {
                    TextField("Task..", text: $task.title)
                }
                
                DatePicker("Date", selection: $task.date, displayedComponents: .date)
                
                Picker("Priority", selection: $task.priority) {
                    ForEach(Priority.allCases, id: \.self) { priority in
                        Text(priority.rawValue).tag(priority)
                    }
                }
                .pickerStyle(.menu)
                
                Picker("Status", selection: $task.status) {
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
        viewModel.update(task: task)
        dismiss()
    }
    
}

//#Preview {
//    NavigationStack {
//        EditTaskView()
//    }
//}
