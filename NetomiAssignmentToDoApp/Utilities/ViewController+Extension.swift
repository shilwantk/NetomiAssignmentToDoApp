//
//  ViewController+Extension.swift
//  NetomiAssignmentToDoApp
//
//  Created by Kirti S on 5/29/23.
//

import Foundation
import UIKit

extension UIViewController {
    
    func presentAlertWithTitle(title: String, message: String, options: [String]?, completion: ((Int) -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if let options = options {
            for (index, option) in options.enumerated() {
                alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
                    guard let completion = completion else { return }
                    completion(index)
                }))
            }
        }
        self.present(alertController, animated: true, completion: nil)
    }
}
