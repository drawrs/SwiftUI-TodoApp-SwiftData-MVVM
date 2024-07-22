//
//  ContentView.swift
//  SwiftUI TodoApp SwiftData MVVM
//
//  Created by Rizal Hilman on 08/07/24.
//

import SwiftUI

struct ListView: View {
    
    @State var keyword: String = ""
    
    var body: some View {
        List {
            ForEach(1...10, id: \.self) { item in
                HStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Task Title")
                                .font(.headline)
                            Text("Sunday 20, July")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        
                        Spacer()
                        
                        VStack(alignment: .trailing) {
                            Text("")
                            Text("DONE")
                                .font(.caption)
                                .foregroundStyle(.white)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 2)
                                .background(.blue)
                                .clipShape(RoundedRectangle(cornerRadius: 5.0))
                                .padding(.vertical, 2)
                        }
                        
                    }
                }
                .swipeActions(edge: .leading, allowsFullSwipe: false) {
                    
                    NavigationLink {
                        EditTaskView()
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
            
        }
    }
    
    private func onDelete(at indexSet: IndexSet){
        for index in indexSet {
            
        }
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
