//
//  TaskRepository.swift
//  Tasky
//
//  Created by Igor Costa Nascimento on 29/01/25.
//

import Foundation


class TaskRepository{
    init(  persistence: Persistence) {
        self.persistence = persistence
        loadTasks()
    }
    var tasks: [Task] = []
    
    private let persistence: Persistence
    private let tasksKey = "tasky-app-tasks"
    
    private func saveTask( ){
        do{
            let taskData = try JSONEncoder().encode(tasks)
            persistence.saveData(data: taskData, forKey: tasksKey)
        }catch{
            print("Ocorreu um erro! \(error)")
        }
    }
    
    private func loadTasks( ){
        
        guard let tasksData = persistence.loadData(forKey: tasksKey) else { return }
        do{
            tasks = try JSONDecoder().decode([Task].self, from: tasksData)
        } catch{
            
            print("Ocorreu um erro! \(error)")
        }
    }
    
    func addTask(_ newtask: Task){
        tasks.append(newtask)
        saveTask()
    }
    
    func removeTask(at index:Int) -> Void {
        guard index >= 0, index<tasks.count else {
            return
        }
        tasks.remove(at: index)
        saveTask()
    }
    
    func completeTask(at index: Int) -> Void {
        guard index>=0, index<tasks.count else {
            return
        }
        tasks[index].isCompleted.toggle()
        saveTask()
    }
}
