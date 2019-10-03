//
//  SuccessSentMoneyViewController.swift
//  TesteNeon
//
//  Created by Gustavo Kin Tanaka Uno on 02/10/19.
//  Copyright © 2019 Gustavo Kin. All rights reserved.
//

import UIKit

internal class SuccessSentMoneyViewController: UIViewController {
    init() {
        super.init(nibName: "SuccessSentMoneyViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func dismissView(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: false)
    }
}
