//
//  Utilities.swift
//  Countdown.io
//
//  Created by Max094_Reikeb on 26/11/2020.
//

import Foundation
import UIKit

class Utilities {

    // function to save an int with a key
    static func saveInt(_ intKey:String, _ count:Int) {
        let defaults = UserDefaults.standard
        defaults.set(count, forKey: intKey)
    }

    // function to get an int with a key
    static func getInt(_ intKey:String) -> Int {
        let defaults = UserDefaults.standard
        let returnInt = defaults.integer(forKey: intKey)
        return returnInt
    }
    
    //function to save a boolean with a key
    static func saveBool(_ boolKey:String, _ value:Bool) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: boolKey)
    }
    
    //function to get a boolean with a key
    static func getBool(_ boolKey:String) -> Bool {
        let defaults = UserDefaults.standard
        let returnBool = defaults.bool(forKey: boolKey)
        return returnBool
    }

}
