//
//  HomeViewModel.swift
//  TesteNeon
//
//  Created by Gustavo Kin on 28/09/19.
//  Copyright © 2019 Gustavo Kin. All rights reserved.
//

import UIKit

protocol HomeViewModelDelegate: class {
    func startLoading()
    func onSuccess()
    func onError(_ error: Error)
}

internal class HomeViewModel: NSObject {
    let clientModel: ClientModel
    
    weak var delegate: HomeViewModelDelegate?
    
    init(clientModel: ClientModel) {
        self.clientModel = clientModel
    }
    
    func callAPI() {
        delegate?.startLoading()
        //Chamada API
        APIClient.generateToken(name: clientModel.name, email: clientModel.email) { (result) in
            switch result {
            case .success(let token):
                UserDefaultUtils.writeUserDefaults(key: UserDefaultConstants.tokenKey, value: token)
                self.delegate?.onSuccess()
            case .failure(let error):
                //como a API não está respondendo, em caso de erro, que vai ser sempre, estou implementando um método de mock da API
                //self.delegate?.onError(error)
                self.mockup(error)
            }
        }
    }
    
    func mockup(_ error: Error) {
        let randomInt = Int.random(in: 0...10)
        if randomInt % 7 == 0 {
            delegate?.onError(error)
        } else {
            let tokenMock = "asdf2-12sd2-wer87"
            UserDefaultUtils.writeUserDefaults(key: UserDefaultConstants.tokenKey, value: tokenMock)
            delegate?.onSuccess()
        }
    }
}
