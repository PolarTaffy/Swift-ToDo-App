//
//  TaskView.swift
//  ToDo
//
//  Created by Student_User on 9/7/25.
//

import SwiftUI

struct TaskView: View{
    var comp: Task
    
    init(comp: Task){
        self.comp = comp;
    }
    
    var body: some View {
        ScrollView {
            Text(comp.title)
            Text(comp.desc)
            Text("Created on " + comp.timeStamp.formatted())
            
        }
    }
}
