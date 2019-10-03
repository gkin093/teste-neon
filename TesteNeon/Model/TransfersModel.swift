//
//  TransfersModel.swift
//  TesteNeon
//
//  Created by Gustavo Kin Tanaka Uno on 02/10/19.
//  Copyright © 2019 Gustavo Kin. All rights reserved.
//

import UIKit

struct TransfersModel: Codable {
    let Id: Int
    let ClienteId: Int
    let Valor: Double
    let Token: String
    let Data: String
}
