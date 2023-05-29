//
//  ViewController+Extension.swift
//  NetomiAssignmentToDoApp
//
//  Created by Kirti S on 5/29/23.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlertWith(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
