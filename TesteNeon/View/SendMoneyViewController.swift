//
//  SendMoneyViewController.swift
//  TesteNeon
//
//  Created by Gustavo Kin on 28/09/19.
//  Copyright © 2019 Gustavo Kin. All rights reserved.
//

import UIKit

internal class SendMoneyViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel: SendMoneyViewModel
    
    init(viewModel: SendMoneyViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "SendMoneyViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        self.navigationItem.title = "ENVIAR DINHEIRO"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
}

extension SendMoneyViewController: UITableViewDelegate, UITableViewDataSource {
    func configureTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .clear
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.listFriends?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib(nibName: "GenericViewCell", bundle: nil), forCellReuseIdentifier: GenericViewCell.cellIdentifier)
        let cell = tableView.dequeueReusableCell(withIdentifier: GenericViewCell.cellIdentifier, for: indexPath) as! GenericViewCell
        cell.friendsModel = viewModel.listFriends![indexPath.row]
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 92
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let friend = self.viewModel.listFriends![indexPath.row]
        let modalViewModel = SendMoneyModalViewModel(friend: friend)
        let modalViewController = SendMoneyModalViewController(viewModel: modalViewModel, navigation: self.navigationController)
        modalViewController.modalTransitionStyle = .crossDissolve
        modalViewController.modalPresentationStyle = .overFullScreen
//        self.navigationController?.show(modalViewController, sender: nil)
        self.present(modalViewController, animated: true, completion: nil)
    }
}
