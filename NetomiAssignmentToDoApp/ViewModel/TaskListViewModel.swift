//
//  TasksViewModel.swift
//  NetomiAssignmentToDoApp
//
//  Created by Kirti S on 5/26/23.
//

import Foundation

/// Protocol to communicate between ViewModel and ViewController for reloading views
protocol TableViewReloadProtocol : AnyObject {
    func didUpdateTaskList()
}

/// View Model for creating, adding, deleting and updating status of tasks
class TaskListViewModel {
    
    ///Tasks array that holds objects of tyep Task
    var tasksArray = [Task]()
    
    weak var delegate : TableViewReloadProtocol?
    
    ///Return total count of tasks
    func getTaskCount() -> Int {
        return tasksArray.count
    }
    
    ///Return task at the given index
    func getTaskAt(index: Int) -> Task {
        return tasksArray[index]
    }
    
    ///Create a task with the given title and due time
    func createTaskWith(title: String, time: Date) -> Task {
        let task = Task(taskName: title, taskTime: time)
        return task
    }
    
    ///Add a task to the existing task array
    func add(task: Task) {
        tasksArray.append(task)
        self.delegate?.didUpdateTaskList()
    }
    
    ///Delete task at the given index from the existing task array
    func deleteTask(at index: Int) {
        tasksArray.remove(at: index)
        self.delegate?.didUpdateTaskList()
    }
    
    ///Mark task as completed at the given index in the existing task array
    func markTaskAsCompleted(at index: Int) {
        tasksArray[index].isCompleted = true
        self.delegate?.didUpdateTaskList()
    }
    
    ///Mark task as not completed at the given index in the existing task array
    func markTaskAsNotCompleted(at index: Int) {
        tasksArray[index].isCompleted = false
        self.delegate?.didUpdateTaskList()
    }
    
    ///Check to see if task is Pending
    func isTaskPending(task: Task) -> Bool {
        if task.taskTime <= Date.now {
            return true
        } else {
            return false
        }
    }
    
    ///Get time string from task date
    func getTimeStringFrom(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm a"
        return formatter.string(from: date)
    }
}
