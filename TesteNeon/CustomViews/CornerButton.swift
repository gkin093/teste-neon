//
//  CornerButton.swift
//  TesteNeon
//
//  Created by Gustavo Kin on 28/09/19.
//  Copyright © 2019 Gustavo Kin. All rights reserved.
//

import UIKit

internal class CornerButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.height / 2
    }
    
    override var isEnabled: Bool {
        didSet {
            setDisableStyle()
        }
    }
    
    private func setDisableStyle() {
        if !isEnabled {
            self.backgroundColor = UIColor(named: "DisableGray")
            self.titleLabel?.textColor = UIColor.darkGray
        } else {
            self.titleLabel?.textColor = UIColor.white
            self.backgroundColor = UIColor(named: "PrimaryColor")
        }
    }
    
}
