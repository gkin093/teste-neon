//
//  HomeViewController.swift
//  TesteNeon
//
//  Created by Gustavo Kin on 28/09/19.
//  Copyright © 2019 Gustavo Kin. All rights reserved.
//

import UIKit

internal class HomeViewController: UIViewController {
    let viewModel: HomeViewModel
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var sendMoneyButton: CornerButton!
    @IBOutlet weak var paymentHistoricButton: CornerButton!
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "HomeViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = viewModel.clientModel.name
        emailLabel.text = viewModel.clientModel.email
        viewModel.delegate = self
        viewModel.callAPI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func sendMoneyAction(_ sender: UIButton) {
        let sendMoneyViewModel = SendMoneyViewModel()
        let sendMoneyViewController = SendMoneyViewController(viewModel: sendMoneyViewModel)
        self.navigationItem.title = ""
        self.navigationController?.pushViewController(sendMoneyViewController, animated: true)
    }
    
    @IBAction func paymentHistoricAction(_ sender: Any) {
        let paymentHistoricViewModel = PaymentHistoricViewModel()
        let paymentHistoricViewController = PaymentHistoricViewController(viewModel: paymentHistoricViewModel)
        self.navigationItem.title = ""
        self.navigationController?.pushViewController(paymentHistoricViewController, animated: true)
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func startLoading() {
        sendMoneyButton.isEnabled = false
        paymentHistoricButton.isEnabled = false
    }
    
    func onSuccess() {
        sendMoneyButton.isEnabled = true
        paymentHistoricButton.isEnabled = true
        //TODO -> Criar tela de sucesso
    }
    
    func onError(_ error: Error) {
        //TODO -> Criar tela de erro
        let viewController = ErrorViewController {
            self.viewModel.callAPI()
        }
        self.present(viewController, animated: true) {
            self.paymentHistoricButton.isEnabled = false
            self.sendMoneyButton.isEnabled = false
        }
    }
    
    
}
