//
//  CancelButton.swift
//  NetomiAssignmentToDoApp
//
//  Created by Kirti S on 5/30/23.
//

import Foundation
import UIKit

@IBDesignable
final class CancelButton: UIButton {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }

    func setup() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 30
        self.layer.borderWidth = 2
        self.layer.borderColor = Constants.Colors.BorderGrey
    }
}
