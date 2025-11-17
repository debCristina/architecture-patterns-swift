//
//  TaskRepository.swift
//  MVC
//
//  Created by Débora Cristina Silva Ferreira on 16/11/25.
//

import Foundation

protocol TaskRepositoryProtocol {
    func add(_ task: TaskModel)
    func getAll() -> [TaskModel]
    func remove(at index: Int)
}

class TaskRepository: TaskRepositoryProtocol {
    static let shared = TaskRepository()   // Singleton
    
    private init() {}
    
    private var tasks: [TaskModel] = []

    func add(_ task: TaskModel) {
        tasks.append(task)
    }
    
    func toggleTask(at index: Int) {
        tasks[index].isDone.toggle()
    }
    
    func getAll() -> [TaskModel] {
        return tasks
    }
    
    func remove(at index: Int) {
        tasks.remove(at: index)
    }
}
extension TaskRepository {
    func getTasks(using strategy: TaskListStrategy) -> [TaskModel] {
        let allTasks = getAll()
        return strategy.sortOrFilter(allTasks)
    }
}
