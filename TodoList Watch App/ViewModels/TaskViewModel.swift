
import SwiftUI

class TaskViewModel: ObservableObject {
    @Published var tasks = [Task]()
    
    func addTask(title: String) {
        let newTask = Task(title: title)
        tasks.append(newTask)
    }
    
    func removeTask(at indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
}
