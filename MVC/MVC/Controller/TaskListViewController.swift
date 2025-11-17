//
//  TaskViewController.swift
//  MVC
//
//  Created by Débora Cristina Silva Ferreira on 13/11/25.
//

import Foundation
import UIKit

class TaskListViewController: UIViewController, UITableViewDelegate {
    let taskView = TaskView()
    let repository = TaskRepository.shared
    let listStrategy = AlphabeticalStrategy()
    
    @objc func didTapCheckButton(_ sender: UIButton) {
        let buttonPosition = sender.convert(CGPoint.zero, to: taskView.tableView)
        
        guard let indexPath = taskView.tableView.indexPathForRow(at: buttonPosition) else { return }
        
        repository.toggleTask(at: indexPath.row)
        taskView.tableView.reloadRows(at: [indexPath], with: .automatic)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            guard indexPath.row < self.repository.getAll().count else { return }
            self.repository.remove(at: indexPath.row)
            self.taskView.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func loadView() {
        self.view = taskView
        taskView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskView.tableView.dataSource = self
        taskView.tableView.delegate = self
        taskView.tableView.register(TaskCell.self, forCellReuseIdentifier: TaskCell.identifier)
    }
}

extension TaskListViewController: TaskViewDelegate {
    func didTapAdicionar() {
        let alert = UIAlertController(title: "Nova Tarefa",
                                      message: "Digite o nome da tarefa",
                                      preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Ex: Comprar pão"
        }
        
        let adicionar = UIAlertAction(title: "Adicionar", style: .default) { _ in
            if let text = alert.textFields?.first?.text, !text.isEmpty {
                self.repository.add(TaskModel(title: text))
                self.taskView.tableView.reloadData()
            }
        }
        
        let cancelar = UIAlertAction(title: "Cancelar", style: .cancel)
        
        alert.addAction(adicionar)
        alert.addAction(cancelar)
        
        present(alert, animated: true)
    }
}

extension TaskListViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listStrategy.sortOrFilter(repository.getAll()).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.identifier, for: indexPath) as! TaskCell
        cell.checkButton.tag = indexPath.row
        cell.checkButton.addTarget(self, action: #selector(didTapCheckButton(_:)), for: .touchUpInside)
        let tasks = listStrategy.sortOrFilter(repository.getAll())
        let task = tasks[indexPath.row]
        cell.configure(with: task.title, completed: task.isDone)
        return cell
    }
}
