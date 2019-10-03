//
//  ViewController.swift
//  TesteNeon
//
//  Created by Gustavo Kin on 28/09/19.
//  Copyright © 2019 Gustavo Kin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let homeViewModel = HomeViewModel(clientModel: ClientModel(name: "Gustavo Uno", email: "gustavokin.uno@gmail.com"))
        let homeViewController = HomeViewController(viewModel: homeViewModel)
        let navigation = UINavigationController(rootViewController: homeViewController)
        self.show(homeViewController, sender: nil)
    }


}

