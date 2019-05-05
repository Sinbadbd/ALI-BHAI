//
//  UserDefaultManager.swift
//  Ali Bhai
//
//  Created by sinbad on 5/5/19.
//  Copyright © 2019 sinbad. All rights reserved.
//

import Foundation
extension UserDefaults{
    enum userDefaultsKeys : String {
        case isSplashScreenLunch
    }
    
    func setSplashScreen(value : Bool){
        set(value, forKey: userDefaultsKeys.isSplashScreenLunch.rawValue)
    }
    func getSplashScreen() -> Bool {
        return bool(forKey: userDefaultsKeys.isSplashScreenLunch.rawValue)
    }
}
