//
//  TaskManager.swift
//  TDDToDoApp
//
//  Created by Maxim Gladkov on 26.09.2022.
//

import Foundation

class TaskManager {
    var tasksCount: Int {
        return tasks.count
    }
    var doneTasksCount: Int {
        return doneTasks.count
    }
    
    private var tasks: [Task] = []
    private var doneTasks: [Task] = []
    
    func add(task: Task) {
        if !tasks.contains(task) {
            tasks.append(task)
        }
    }
    
    func task(at index: Int) -> Task {
        return tasks[index]
    }
    
    func checkTask(at index: Int) {
        let doneTask = tasks.remove(at: index)
        doneTasks.append(doneTask)
    }
    
    func uncheckTask(at index: Int) {
        let Task = doneTasks.remove(at: index)
        tasks.append(Task)
    }
    
    func doneTask(at index: Int) -> Task {
        return doneTasks[index]
    }
    
    func removeAll() {
        tasks.removeAll()
        doneTasks.removeAll()
    }
}
