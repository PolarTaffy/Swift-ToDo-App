//
//  ContentView.swift
//  ToDo
//
//  Created by Student_User on 9/6/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Task]
    @State private var addingTask = false

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        //Task Viewing Screen
                        Text(item.title).font(.title)
                        Text(item.desc).font(.headline)
                        Text("Task Created \(item.timeStamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.title)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: {addItem()
                        addingTask.toggle()}) {
                        Label("Add Item", systemImage: "plus")
                        
                    }.sheet(isPresented: $addingTask) {
                        AddTask()
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Task.self, inMemory: true)
}
