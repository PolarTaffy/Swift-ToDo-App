//
//  Task.swift
//  ToDo
//
//  Created by Student_User on 9/6/25.
//

import SwiftData
import Foundation

@Model
class Task {
    var timeStamp : Date
    var title : String
    var desc : String
    var completed : Bool
    
    init(timeStamp: Date, title: String, desc: String){
        self.timeStamp = timeStamp
        self.title = title
        self.desc = desc
        self.completed = false
    }
}
