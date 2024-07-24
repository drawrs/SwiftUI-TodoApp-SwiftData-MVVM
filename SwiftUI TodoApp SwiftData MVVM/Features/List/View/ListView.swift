//
//  ContentView.swift
//  SwiftUI TodoApp SwiftData MVVM
//
//  Created by Rizal Hilman on 08/07/24.
//

import SwiftUI
import SwiftData

struct ListView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Query var tasks: [Task]
    @State var keyword: String = ""
    
    // This variables holds filtered task based on user keyword
    @State var filteredTasks: [Task] = []
    
    var body: some View {
        List {
            // Add short if statement so it can choose between two values
            ForEach(keyword.isEmpty ? tasks : filteredTasks, id: \.self) { task in
                HStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(task.title)
                                .font(.headline)
                            Text(task.date.formattedString())
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing) {
                            Text(task.priority.rawValue)
                            Text(task.status.rawValue)
                                .font(.caption)
                                .foregroundStyle(.white)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 2)
                                .background(task.status == .done ? .blue : .red)
                                .clipShape(RoundedRectangle(cornerRadius: 5.0))
                                .padding(.vertical, 2)
                        }
                        
                    }
                }
                .swipeActions(edge: .leading, allowsFullSwipe: false) {
                    NavigationLink {
                        // move to edit screen with selected task data
                        EditTaskView(task: task)
                    } label: {
                        Text("Edit")
                    }
                    .tint(.blue)
                }
            }
            .onDelete(perform: onDelete)
        }
        .overlay(alignment: .center, content: {
            Group {
                if false {
                    Text("Oops, looks like there's no data...")
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
            }
        })
        .navigationTitle("Todo List")
        .searchable(text: $keyword)
        .toolbar(content: {
            ToolbarItem {
                NavigationLink {
                    AddTaskView()
                } label: {
                    Image(systemName: "plus")
                }
            }
            
        })
        .onChange(of: keyword) {
            // Predicate operation
            do {
                let descriptor = FetchDescriptor<Task>(predicate: #Predicate<Task> { task in
                    task.title.contains(keyword)
                }, sortBy: [SortDescriptor(\.date, order: .reverse)])
                
                self.filteredTasks = try modelContext.fetch(descriptor)
            } catch {
                print("Failed to search.. ", error.localizedDescription)
            }
        }
    }
    
    // TODO: to be updated
    private func onDelete(at indexSet: IndexSet){
        for index in indexSet {
            let task = tasks[index]
            modelContext.delete(task)
        }
    }
    
    // TODO: to be updated
    private func onEdit() {
        print("Edit action")
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
}
