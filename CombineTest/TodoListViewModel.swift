//
//  TodoListViewModel.swift
//  CombineTest
//
//  Created by 이민지 on 2023/06/14.
//

import SwiftUI
import Combine

protocol TodoListDelegate {
    func todoListDidUpdate()
}

class TodoListViewModel: ObservableObject {
    @Published var todos = [TodoItem]()
    private var cancellables = Set<AnyCancellable>()
    var delegate: TodoListDelegate?
    
    func addTodoItem(withTitle title: String) {
        let newItem = TodoItem(title: title, isCompleted: false)
        todos.append(newItem)
        delegate?.todoListDidUpdate()
    }
    
    func toggleCompletion(for item: TodoItem) {
        guard let index = todos.firstIndex(where: {$0.id == item.id}) else { return }
        todos[index].isCompleted.toggle()
        delegate?.todoListDidUpdate()
    }
    
    func removeItem(at index: Int) {
        todos.remove(at: index)
        delegate?.todoListDidUpdate()
    }
    
    init() {
        $todos
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
    }
}
