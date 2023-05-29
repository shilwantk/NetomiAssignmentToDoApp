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
    
    private var viewModel = TasksViewModel.sharedInstance
    private var taskName = String()
    private var taskTime = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = Constants.VCTitles.addTaskVC
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
            
            let alert = UIAlertController(title: "Success!", message: "Task successfully added.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    private func setUpUI() {
        
        taskTimePicker.locale = Locale.init(identifier: "en")
        
        cancelButton.layer.borderColor = Constants.Colors.borderGrey
        cancelButton.layer.borderWidth = 2
        cancelButton.layer.cornerRadius = 20
        cancelButton.layer.masksToBounds = true
        cancelButton.setTitleColor(Constants.Colors.purple, for: .normal)
        
        addButton.layer.cornerRadius = 20
        addButton.layer.masksToBounds = true
        addButton.setTitleColor( .white, for: .normal)
        addButton.backgroundColor = Constants.Colors.purple
        addButton.setTitleColor(.white, for: .normal)
    }
    
    private func isValidTaskDetails() -> Bool {
        
        guard let title = taskTitleTextFiled.text, !title.isEmpty else {
            let alert = UIAlertController(title: "Alert!", message: "No task name added", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false
        }
        
        let timeString = viewModel.getTimeStringFrom(date: taskTimePicker.date)
        if timeString.isEmpty {
            let alert = UIAlertController(title: "Alert!", message: "No task time selected", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false
        }
        taskName = title
        taskTime = taskTimePicker.date
        return true
    }
}

