//
//  TaskVIEW.swift
//  MVC
//
//  Created by Débora Cristina Silva Ferreira on 13/11/25.
//

import Foundation
import UIKit

protocol TaskViewDelegate: AnyObject {
    func didTapAdicionar()
}

class TaskView: UIView {
    weak var delegate: TaskViewDelegate?

    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Adicionar tarefa", for: .normal) 
        button.backgroundColor = .purple
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(addTapped), for: .touchUpInside)
        return button
    }()
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .systemBackground
    
        addSubview(tableView)
        addSubview(addButton)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            addButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
       
    }
    
    @objc private func addTapped() {
        delegate?.didTapAdicionar()
    }
    
    
}
