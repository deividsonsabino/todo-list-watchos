//
//  ContentView.swift
//  TodoList Watch App
//
//  Created by Deividson Sabino on 27/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TaskViewModel()
    @State private var newTaskTitle = ""
    
    var body: some View {
        List {
            ForEach(viewModel.tasks) { task in
                HStack {
                    Text(task.title)
                        .font(.headline)
                        .strikethrough(task.isCompleted, color: .gray)
                    Spacer()
                    Button(action : {
                        if let index = viewModel.tasks.firstIndex(where: { $0.id == task.id}) {
                            viewModel.tasks[index].isCompleted.toggle()
                        }
                    }) {
                        Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    }
                }
            }.onDelete(perform: viewModel.removeTask)
            
            if viewModel.tasks.isEmpty {
                Text("No tasks yet").foregroundStyle(.gray)
            }
        }
        VStack {
            TextFieldLink {
                Label("Add task", systemImage: "plus.circle.fill")
                
            } onSubmit: { newTitle in
                viewModel.addTask(title: newTitle )
            }
        }.navigationTitle("Tasks")
    }
}

#Preview {
    ContentView()
}
