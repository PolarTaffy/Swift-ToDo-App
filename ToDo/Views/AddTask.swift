//
//  AddTask.swift
//  ToDo
//
//  Created by Student_User on 9/6/25.
//

import SwiftUI
import SwiftData

struct AddTask: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @State private var title: String = ""
    @State private var fullText: String = ""

    
    var body: some View {
        ScrollView {
            Text("Add New Task")
                .font(.largeTitle)
                .bold()
                .padding()
                .padding(.top, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Task Name", text: $title)
                .padding(.horizontal)
                .bold()
                .font(.title)
            
            Text("Description:")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.top, 10)
            
            TextEditor(text: $fullText)
                .padding(8)
                .font(.body)
                .textFieldStyle(.roundedBorder)
                .frame(minHeight: 150) // Optional: set a reasonable height
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
                .padding(.horizontal)
            
            Button(action: submitTask){
                Text("Submit Task").frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            
            
        }
    }
    
    private func submitTask() {
            guard !title.isEmpty else { return } // basic validation
            let newTask = Task(timeStamp: Date(), title: title, desc: fullText)
            modelContext.insert(newTask)
            dismiss()
    }
}
