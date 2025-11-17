//
//  TaskListStrategy.swift
//  MVC
//
//  Created by Débora Cristina Silva Ferreira on 16/11/25.
//

import Foundation

protocol TaskListStrategy {
    func sortOrFilter(_ tasks: [TaskModel]) -> [TaskModel]
}

class ShowAllStrategy: TaskListStrategy {
    func sortOrFilter(_ tasks: [TaskModel]) -> [TaskModel] {
        return tasks
    }
}

class CompletedOnlyStrategy: TaskListStrategy {
    func sortOrFilter(_ tasks: [TaskModel]) -> [TaskModel] {
        return tasks.filter { $0.isDone }
    }
}

class PendingOnlyStrategy: TaskListStrategy {
    func sortOrFilter(_ tasks: [TaskModel]) -> [TaskModel] {
        return tasks.filter { !$0.isDone }
    }
}

class AlphabeticalStrategy: TaskListStrategy {
    func sortOrFilter(_ tasks: [TaskModel]) -> [TaskModel] {
        return tasks.sorted { $0.title.lowercased() < $1.title.lowercased() }
    }
}

