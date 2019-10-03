//
//  ErrorViewController.swift
//  TesteNeon
//
//  Created by Gustavo Kin Tanaka Uno on 02/10/19.
//  Copyright © 2019 Gustavo Kin. All rights reserved.
//

import UIKit

internal class ErrorViewController: UIViewController {
    private var confirmHandler: (() -> Void)?
    
    init(confirmHandler: @escaping () -> Void) {
        super.init(nibName: "ErrorViewController", bundle: nil)
        self.confirmHandler = confirmHandler
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tryAgainAcrion(_ sender: UIButton) {
        self.dismiss(animated: true) {
            self.confirmHandler?()
        }
    }
    
}
