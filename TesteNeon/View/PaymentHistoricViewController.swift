//
//  PaymentHistoricViewController.swift
//  TesteNeon
//
//  Created by Gustavo Kin Tanaka Uno on 01/10/19.
//  Copyright © 2019 Gustavo Kin. All rights reserved.
//

import UIKit

internal class PaymentHistoricViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel: PaymentHistoricViewModel
    
    init(viewModel: PaymentHistoricViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "PaymentHistoricViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        self.navigationItem.title = "HISTÓRICO DE ENVIOS"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
}

extension PaymentHistoricViewController: UITableViewDelegate, UITableViewDataSource {
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
}
