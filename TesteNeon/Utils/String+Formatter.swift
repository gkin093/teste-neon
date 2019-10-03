//
//  String+Formatter.swift
//  TesteNeon
//
//  Created by Gustavo Kin Tanaka Uno on 01/10/19.
//  Copyright © 2019 Gustavo Kin. All rights reserved.
//

import Foundation

import Foundation

extension String {
    var localize: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func onlyNumbers() -> String {
        return filter("01234567890".contains)
    }
}

extension String {
    func currencyFormatted() -> String {
        
        let numbers = onlyNumbers()
        var decimal = NSDecimalNumber(string: numbers)
        guard decimal != NSDecimalNumber.notANumber //&& decimal != NSDecimalNumber.zero
            else {
                return ""
        }
        decimal = decimal.multiplying(byPowerOf10: -2)
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyAccounting
        formatter.currencyDecimalSeparator = ","
        formatter.currencyGroupingSeparator = "."
        formatter.currencySymbol = "R$"
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        return formatter.string(from: decimal) ?? ""
    }
}
