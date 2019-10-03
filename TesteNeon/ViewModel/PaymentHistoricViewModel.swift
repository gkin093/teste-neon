//
//  PaymentHistoricViewModel.swift
//  TesteNeon
//
//  Created by Gustavo Kin Tanaka Uno on 01/10/19.
//  Copyright © 2019 Gustavo Kin. All rights reserved.
//

import UIKit

internal class PaymentHistoricViewModel: NSObject {
    var listFriends: [FriendsModel]?
    
    override init() {
        super.init()
        self.mockListFriends()
    }
    
    func mockListFriends() {
        listFriends = [
            FriendsModel(clientId: 1, name: "Darth Vader", shortName: "DV", imageName: "ico_darth", phone: "(11)98765-4321", value: "R$320,00", email: "darth.vader@outlook.com"),
            FriendsModel(clientId: 2, name: "Luke Skywalker", shortName: "LS", imageName: "", phone: "(11)98823-4121", value: "R$600,00", email: "l.skywalker@hotmail.com"),
            FriendsModel(clientId: 3, name: "Harry Potter", shortName: "HP", imageName: "", phone: "(11)97243-9524", value: "R$1.0000,00", email: "harryp@gmail.com"),
            FriendsModel(clientId: 4, name: "Tony Stark", shortName: "TS", imageName: "ico_tony", phone: "(11)99763-1241", value: "R$200,00", email: "iron.man@yahoo.com.br"),
            FriendsModel(clientId: 5, name: "Peter Parker", shortName: "PP", imageName: "", phone: "(11)99142-0765", value: "R$150,00", email: "pparker@aol.com"),
            FriendsModel(clientId: 6, name: "Natasha Ronaoff", shortName: "NR", imageName: "ico_natasha", phone: "(11)99972-0113", value: "R$3.000,12", email: "black.widow@gmail.com"),
            FriendsModel(clientId: 7, name: "Clark Kent", shortName: "CK", imageName: "", phone: "(11)99523-1122", value: "R$900,00", email: "kentc@hotmail.com"),
            FriendsModel(clientId: 8, name: "Jean Grey", shortName: "JG", imageName: "ico_jean", phone: "(11)98876-0012", value: "R$10,50", email: "phoenix@outlook.com"),
            FriendsModel(clientId: 9, name: "Bruce Wayne", shortName: "BW", imageName: "", phone: "(11)96532-2214", value: "R$1.300.000,99", email: "bat.wayne@yahoo.com"),
            FriendsModel(clientId: 10, name: "Selina Kyle", shortName: "SK", imageName: "", phone: "(11)97563-4221", value: "R$50.000,00", email: "catwoman@gmail.com"),
            FriendsModel(clientId: 11, name: "Belatrix Lestrange", shortName: "BL", imageName: "", phone: "(11)96662-7492", value: "R$1.100,35", email: "l.belatrix@gmail.com"),
            FriendsModel(clientId: 12, name: "Sirius Black", shortName: "SB", imageName: "", phone: "(11)92157-8924", value: "R$802,00", email: "sirius.azkaban@outlook.com"),
            FriendsModel(clientId: 13, name: "Alvo Dumbledore", shortName: "AD", imageName: "", phone: "(11)93527-1123", value: "R$650,00", email: "dumbledore@gmail.com"),
            FriendsModel(clientId: 14, name: "Harleen Frances", shortName: "HF", imageName: "ico_arlequina", phone: "(11)92141-3343", value: "R$240,00", email: "arlequina@gmail.com"),
            FriendsModel(clientId: 15, name: "Bruce Banner", shortName: "BB", imageName: "ico_bruce", phone: "(11)97251-4532", value: "R$120,00", email: "hbrucebanner@yahoo.com")
        ]
    }
    
    func callAPI() {
        guard let token = UserDefaultUtils.readUserDefaults(key: UserDefaultConstants.tokenKey) as? String else { return }
        APIClient.getTransfers(token: token) { (result) in
            switch result {
            case .success(let transfers):
                print(transfers)
            case .failure(let error):
                print(error)
            }
        }
    }
}
