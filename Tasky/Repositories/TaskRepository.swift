//
//  TaskRepository.swift
//  Tasky
//
//  Created by Igor Costa Nascimento on 29/01/25.
//

import Foundation


class TaskRepository{
    init() {
        
    }
    var tasks: [Task] = []
    
    func addTask(_ newtask: Task){
        tasks.append(newtask)
    }
    
    func removeTask(at index:Int) -> Void {
        guard index >= 0, index<tasks.count else {
            return
        }
        tasks.remove(at: index)
    }
    
    func completeTask(at index: Int) -> Void {
        guard index>=0, index<tasks.count else {
            return
        }
        tasks[index].isCompleted.toggle()
    }
}
