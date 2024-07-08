//
//  ContentView.swift
//  SwiftUI TodoApp SwiftData MVVM
//
//  Created by Rizal Hilman on 08/07/24.
//

import SwiftUI

struct ListView: View {
    @State var viewModel: ListViewModel = .init()
    @State var keyword: String = ""
    
    
    var body: some View {
        List {
            ForEach(viewModel.tasks) { task in
                HStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(task.title)
                                .font(.headline)
                            Text("Monday 15, June")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        
                        Spacer()
                        
                        VStack {
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
                    Button {
                        
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
                if viewModel.tasks.isEmpty {
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
                    AddTaskView(viewModel: $viewModel)
                } label: {
                    Image(systemName: "plus")
                }
            }
            
        })
        .onChange(of: keyword) {
            viewModel.searchTask(keyword: keyword)
        }
    }
    
    private func onDelete(at indexSet: IndexSet){
        print("Delete action")
    }
    
    private func onEdit() {
        print("Edit action")
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
}
