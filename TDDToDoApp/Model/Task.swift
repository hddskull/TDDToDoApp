//
//  Task.swift
//  TDDToDoApp
//
//  Created by Maxim Gladkov on 16.09.2022.
//

import Foundation

struct Task {
    let title: String
    let description: String?
    let date: Date?
    let location: Location?
    
    init(title: String,
         description: String? = nil,
         date: Date? = nil,
         location: Location? = nil) {
        self.title = title
        self.description = description
        self.date = date ?? Date()
        self.location = location
    }
}

extension Task: Equatable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        if lhs.title == rhs.title,
           lhs.description == rhs.description,
           lhs.location == rhs.location {
            return true
        }
        else {
            return false
        }
    }
}
