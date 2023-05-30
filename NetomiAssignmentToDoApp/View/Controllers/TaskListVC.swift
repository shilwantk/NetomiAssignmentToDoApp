//
//  TaskListVC.swift
//  NetomiAssignmentToDoApp
//
//  Created by Kirti S on 5/26/23.
//

import UIKit


/// Controller to hold a table view that shows a list of tasks
class TaskListVC: UIViewController {
    
    @IBOutlet weak var tasksTableView : UITableView!
    private var viewModel = TaskListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.topItem?.title = Constants.VCTitles.TasksVC
        navigationController?.navigationBar.prefersLargeTitles = true
        
        viewModel.delegate = self
        setUpTableView()
    }
    
    private func setUpTableView() {
        tasksTableView.register(UINib(nibName: TaskTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: TaskTableViewCell.identifier)
    }
    
    @IBAction func navigateToAddTaskVC() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "AddTaskVC") as? AddTaskVC else { return }
        vc.viewModel = self.viewModel
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension TaskListVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getTaskCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.identifier, for: indexPath) as? TaskTableViewCell else { return UITableViewCell() }
        
        let task = viewModel.getTaskAt(index: indexPath.row)
        cell.tag = indexPath.row
        cell.cellData = task
    
        cell.completeButtonPressed = { [self] in
            if task.isCompleted {
                viewModel.markTaskAsNotCompleted(at: indexPath.row)
            } else {
                viewModel.markTaskAsCompleted(at: indexPath.row)
            }
        }
        
        cell.deleteButtonPressed = { [self] in
            presentAlertWithTitle(title: Constants.AlertTitleStrings.Failure, message: Constants.AlertMessageString.DeleteTaskConfirmation, options: ["OK", "Cancel"]) { option in
                switch option {
                case 0:
                    self.viewModel.deleteTask(at: indexPath.row)
                case 1:
                    self.dismiss(animated: true)
                default: break
                }
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension TaskListVC : TableViewReloadProtocol {
    
    func didUpdateTaskList() {
        
        DispatchQueue.main.async {
            self.tasksTableView.reloadData()
        }
    }
}
