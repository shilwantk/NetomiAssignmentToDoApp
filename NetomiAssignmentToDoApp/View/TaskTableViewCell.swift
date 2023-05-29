//
//  TaskTableViewCell.swift
//  NetomiAssignmentToDoApp
//
//  Created by Kirti S on 5/26/23.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var isCompletedButton: UIButton!
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var taskTimeLabel: UILabel!
    @IBOutlet weak var isPendingLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    private var viewModel = TaskListViewModel()
    
    var completeButtonPressed : (() -> ()) = {}
    var deleteButtonPressed : (() -> ()) = {}
    
    var cellData : Task? {
        didSet {
            guard let task = cellData   else { return }
            setUpCellWith(task: task)
        }
    }
    
    static var nibName: String {
        return String(describing: self)
    }
    
    static var identifier: String {
        return String(describing: self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        isCompletedButton.layer.borderColor = Constants.Colors.borderGrey
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setUpCellWith(task: Task) {
        
        taskNameLabel.text = task.taskName
        
        let timeText = viewModel.getTimeStringFrom(date: task.taskTime)
        taskTimeLabel.text = timeText
        
        if task.isCompleted {
            let image = UIImage(named: "completed")
            isCompletedButton.setImage(image, for: .normal)
        } else {
            isCompletedButton.setImage(UIImage(), for: .normal)
        }
        
        if task.isPending {
            isPendingLabel.isHidden = false
            isPendingLabel.text = Constants.TaskStatus.pending
            taskNameLabel.textColor = .red
        } else {
            isPendingLabel.isHidden = true
            taskNameLabel.textColor = .black
        }
        
        if viewModel.isTaskPending(task: task) {
            isPendingLabel.isHidden = false
            isPendingLabel.text = Constants.TaskStatus.pending
        } else {
            isPendingLabel.isHidden = true
        }
    }
    
    @IBAction func didTapCompleteButton(_ sender: Any) {
        completeButtonPressed()
    }
    
    @IBAction func didTapDeleteButton(_ sender: Any) {
        deleteButtonPressed()
    }
}
