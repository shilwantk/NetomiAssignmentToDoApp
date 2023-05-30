//
//  AddButton.swift
//  NetomiAssignmentToDoApp
//
//  Created by Kirti S on 5/30/23.
//

import UIKit

@IBDesignable
final class AddButton: UIButton {
    
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
        self.backgroundColor = Constants.Colors.Purple
        self.layer.cornerRadius = 30
    }
}


