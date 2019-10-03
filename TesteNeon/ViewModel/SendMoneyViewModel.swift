//
//  SendMoneyViewModel.swift
//  TesteNeon
//
//  Created by Gustavo Kin on 28/09/19.
//  Copyright © 2019 Gustavo Kin. All rights reserved.
//

import UIKit

internal class SendMoneyViewModel: NSObject {
    var listFriends: [FriendsModel]?
    
    override init() {
        super.init()
        self.mockListFriends()
    }
    
    func mockListFriends() {
        listFriends = [
            FriendsModel(clientId: 1, name: "Darth Vader", shortName: "DV", imageName: "ico_darth", phone: "(11)98765-4321", value: nil, email: "darth.vader@outlook.com"),
            FriendsModel(clientId: 2, name: "Luke Skywalker", shortName: "LS", imageName: "", phone: "(11)98823-4121", value: nil, email: "l.skywalker@hotmail.com"),
            FriendsModel(clientId: 3, name: "Harry Potter", shortName: "HP", imageName: "", phone: "(11)97243-9524", value: nil, email: "harryp@gmail.com"),
            FriendsModel(clientId: 4, name: "Tony Stark", shortName: "TS", imageName: "ico_tony", phone: "(11)99763-1241", value: nil, email: "iron.man@yahoo.com.br"),
            FriendsModel(clientId: 5, name: "Peter Parker", shortName: "PP", imageName: "", phone: "(11)99142-0765", value: nil, email: "pparker@aol.com"),
            FriendsModel(clientId: 6, name: "Natasha Ronaoff", shortName: "NR", imageName: "ico_natasha", phone: "(11)99972-0113", value: nil, email: "black.widow@gmail.com"),
            FriendsModel(clientId: 7, name: "Clark Kent", shortName: "CK", imageName: "", phone: "(11)99523-1122", value: nil, email: "kentc@hotmail.com"),
            FriendsModel(clientId: 8, name: "Jean Grey", shortName: "JG", imageName: "ico_jean", phone: "(11)98876-0012", value: nil, email: "phoenix@outlook.com"),
            FriendsModel(clientId: 9, name: "Bruce Wayne", shortName: "BW", imageName: "", phone: "(11)96532-2214", value: nil, email: "bat.wayne@yahoo.com"),
            FriendsModel(clientId: 10, name: "Selina Kyle", shortName: "SK", imageName: "", phone: "(11)97563-4221", value: nil, email: "catwoman@gmail.com"),
            FriendsModel(clientId: 11, name: "Belatrix Lestrange", shortName: "BL", imageName: "", phone: "(11)96662-7492", value: nil, email: "l.belatrix@gmail.com"),
            FriendsModel(clientId: 12, name: "Sirius Black", shortName: "SB", imageName: "", phone: "(11)92157-8924", value: nil, email: "sirius.azkaban@outlook.com"),
            FriendsModel(clientId: 13, name: "Alvo Dumbledore", shortName: "AD", imageName: "", phone: "(11)93527-1123", value: nil, email: "dumbledore@gmail.com"),
            FriendsModel(clientId: 14, name: "Harleen Frances", shortName: "HF", imageName: "ico_arlequina", phone: "(11)92141-3343", value: nil, email: "arlequina@gmail.com"),
            FriendsModel(clientId: 15, name: "Bruce Banner", shortName: "BB", imageName: "ico_bruce", phone: "(11)97251-4532", value: nil, email: "hbrucebanner@yahoo.com")
        ]
    }
}
