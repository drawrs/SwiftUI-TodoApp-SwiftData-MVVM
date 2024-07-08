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
            ForEach(1...10, id: \.self) { item in
                HStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Shopping")
                                .font(.headline)
                            Text("Monday 15, June")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                        VStack {
                            Text("⭐️⭐️⭐️")
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
                    Button {
                        
                    } label: {
                        Text("Edit")
                    }
                    .tint(.blue)
                }
            }
            .onDelete(perform: onDelete)
        }
        .navigationTitle("Todo List")
        .searchable(text: $keyword)
        .toolbar(content: {
            ToolbarItem {
                Button(action: {
                    onEdit()
                }, label: {
                    Image(systemName: "plus")
                })
            }
        })
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
