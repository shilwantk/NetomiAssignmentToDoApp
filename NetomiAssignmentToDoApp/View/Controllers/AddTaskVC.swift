//
//  AddTaskVC.swift
//  NetomiAssignmentToDoApp
//
//  Created by Kirti S on 5/26/23.
//

import UIKit

class AddTaskVC: UIViewController {

    @IBOutlet weak var taskTitleTextFiled: UITextField!
    @IBOutlet weak var taskTimePicker: UIDatePicker!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    var viewModel = TaskListViewModel()
    private var taskName = String()
    private var taskTime = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = Constants.VCTitles.AddTaskVC
        navigationController?.navigationBar.prefersLargeTitles = false
        
        setUpUI()
    }
    
    @IBAction func didTapCancelButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapAddButton(_ sender: Any) {
        
        if isValidTaskDetails() {
            
            let newTask = viewModel.createTaskWith(title: taskName, time: taskTime)
            viewModel.add(task: newTask)
            presentAlertWithTitle(title: Constants.AlertTitleStrings.Success, message: Constants.AlertMessageString.TaskAddedSuccessfully, options: ["OK"]) { option in
                switch option {
                case 0:
                    self.dismiss(animated: true)
                default: break
                }
            }
        }
    }
    
    private func setUpUI() {
        taskTimePicker.locale = Locale.init(identifier: "en")
    }
    
    private func isValidTaskDetails() -> Bool {
        
        guard let title = taskTitleTextFiled.text, !title.isEmpty else {
            presentAlertWithTitle(title: Constants.AlertTitleStrings.Failure, message: Constants.AlertMessageString.NoNameAdded, options: ["OK"]) { option in
                switch option {
                case 0:
                    self.dismiss(animated: true)
                default: break
                }
            }
            return false
        }
        
        let timeString = viewModel.getTimeStringFrom(date: taskTimePicker.date)
        if timeString.isEmpty {
            presentAlertWithTitle(title: Constants.AlertTitleStrings.Failure, message: Constants.AlertMessageString.NoTimeAdded, options: ["OK"]) { option in
                switch option {
                case 0:
                    self.dismiss(animated: true)
                default: break
                }
            }
            return false
        }
        
        taskName = title
        taskTime = taskTimePicker.date
        return true
    }
}

