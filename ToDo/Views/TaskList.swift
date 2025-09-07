//
//  TaskList.swift
//  ToDo
//
//  Created by Student_User on 9/6/25.
//

import SwiftUI
import SwiftData

struct TaskList: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Task]
    @State private var addingTask = false

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        //Task Viewing Screen
                        TaskView(comp: item)
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
                    Button(action: {AddTask()
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

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}
