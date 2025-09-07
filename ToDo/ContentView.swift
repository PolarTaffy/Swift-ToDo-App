//
//  ContentView.swift
//  ToDo
//
//  Created by Student_User on 9/6/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    var body: some View {
        TabView {
            Tab("To Do", systemImage: "checkmark.circle") {
                TaskList()
            }
            Tab("Settings", systemImage: "gear.circle.fill"){
                Text("Settings View")
            }
            
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Task.self, inMemory: true)
}
