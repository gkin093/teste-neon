//
//  SendMoneyModalViewModel.swift
//  TesteNeon
//
//  Created by Gustavo Kin Tanaka Uno on 01/10/19.
//  Copyright © 2019 Gustavo Kin. All rights reserved.
//

import UIKit

protocol SendMoneyModalViewModelDelegate: class {
    func onSuccess()
    func onError()
    func onLoading()
}

internal class SendMoneyModalViewModel: NSObject {
    let friend: FriendsModel
    
    weak var delegate: SendMoneyModalViewModelDelegate?
    
    init(friend: FriendsModel) {
        self.friend = friend
    }
    
    func callAPI(value: Double) {
        guard let token = UserDefaultUtils.readUserDefaults(key: UserDefaultConstants.tokenKey) as? String else { return }
        
        APIClient.sendMoney(clientId: friend.clientId, value: value, token: token) { (result) in
            switch result {
            case .success(let isOk):
                if isOk {
                    self.delegate?.onSuccess()
                } else {
                    self.delegate?.onError()
                }
            case .failure:
                //como a API não está respondendo, em caso de erro, que vai ser sempre, estou implementando um método de mock da API
//                self.delegate?.onError()
                self.mockUp()
            }
        }
    }
    
    func mockUp() {
        let random = Int.random(in: 1...10)
        var responseSuccess = true
        if random % 7 == 0 {
            responseSuccess = false
        }
        if responseSuccess {
            delegate?.onSuccess()
        } else {
            delegate?.onError()
        }
    }
}
