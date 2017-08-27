//
//  Utilities.swift
//  Will I Burn
//
//  Created by Vy Nguyen on 8/27/17.
//  Copyright © 2017 Vy Nguyen. All rights reserved.
//

import Foundation

class Utilities
{
    // MARK - user defaults storage
    var skinTypeKey = "skinType"
    
    func getStorage () -> UserDefaults
    {
        return UserDefaults.standard
    }
    
    func setSkinType (value: String)
    {
        let defaults = getStorage()
        defaults.setValue(value, forKey: skinTypeKey)
        defaults.synchronize()
    }
    
    func getSkinType () -> String {
        let defaults = getStorage()
        if let result = defaults.string(forKey: skinTypeKey) {
            return result
        }
        return SkinType().type1
    }
}
