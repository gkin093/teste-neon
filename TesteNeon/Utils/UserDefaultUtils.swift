//
//  UserDefaultUtils.swift
//  TesteNeon
//
//  Created by Gustavo Kin Tanaka Uno on 02/10/19.
//  Copyright © 2019 Gustavo Kin. All rights reserved.
//

import Foundation

internal class UserDefaultUtils {
    static func readUserDefaults(key: String) -> Any? {
        let preferences = UserDefaults.standard
        guard let _ = preferences.object(forKey: key), let value = preferences.object(forKey: key) else {
            return nil
        }
        
        return value
    }

    static func writeUserDefaults(key: String, value: Any) {
        let preferences = UserDefaults.standard
        let _ = preferences.set(value, forKey: key)
        
        //  Save to disk
        let didSave = preferences.synchronize()
        
        if !didSave {
            print("Não salvou o user default")
        }
    }
}
