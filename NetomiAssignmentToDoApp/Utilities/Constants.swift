//
//  Constants.swift
//  NetomiAssignmentToDoApp
//
//  Created by Kirti S on 5/26/23.
//

import Foundation
import UIKit

struct Constants {
    
    struct VCTitles {
        static let TasksVC = "Task List"
        static let AddTaskVC = "Add Task"
    }
    
    struct TaskStatus {
        static let Pending = "Pending"
    }
    
    struct Colors {
        static let BorderGrey = UIColor(red: 0.455, green: 0.467, blue: 0.459, alpha: 0.5).cgColor
        static let Purple = UIColor(red: 0.404, green: 0.314, blue: 0.643, alpha: 1)
        static let LightPurple = UIColor(red: 236/255, green: 230/255, blue: 240/255, alpha: 1)
    }
    
    struct AlertTitleStrings {
        static let Success = "Success!"
        static let Failure = "Alert!"
    }
    
    struct AlertMessageString {
        static let NoNameAdded = "No task title added"
        static let NoTimeAdded = "No task time selected"
        static let TaskAddedSuccessfully = "Task successfully added"
        static let DeleteTaskConfirmation = "Do you want to delete this task? This action can’t be undone."
    }
}
