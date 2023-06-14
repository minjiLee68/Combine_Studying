//
//  ContentView.swift
//  CombineTest
//
//  Created by 이민지 on 2023/06/14.
//

import SwiftUI
import Combine

struct ContentView: View {
    @StateObject var viewModel = TodoListViewModel()
    @State var todos = [TodoItem]()
    @State private var newTodoTitle = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(todos.indices, id: \.self) { i in
                        Text(todos[i].title)
                    }
                }
                
                Button(action: {
                    viewModel.addTodoItem(withTitle: newTodoTitle)
                    newTodoTitle = ""
                }, label: {
                    Text("Add Todo")
                })
                
                TextField("New Todo", text: $newTodoTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
    //            Text("Count : \(viewModel.count)")
    //                .font(.title2)
    //
    //            Button {
    //                viewModel.increment()
    //            } label: {
    //                Text(viewModel.text)
    //                    .font(.title)
    //                    .padding()
    //                    .background(Color.blue)
    //                    .foregroundColor(.white)
    //                    .cornerRadius(10)
    //            }

            }
            .navigationTitle("Todo List")
        }
        .onAppear {
            viewModel.delegate = self
        }
    }
}

extension ContentView: TodoListDelegate {
    func todoListDidUpdate() {
        todos = viewModel.todos
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
