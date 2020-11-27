//
//  Utilities.swift
//  Countdown.io
//
//  Created by Max094_Reikeb on 26/11/2020.
//

import Foundation
import UIKit

class Utilities {
    
    // Filled button style
    static func styleFilledButton(_ button:UIButton, _ colored:String, _ radius:CGFloat) {
        
        // Filled rounded corner style
        if (colored == "blue") {
            button.backgroundColor = UIColor.init(red: 69/255, green: 148/255, blue: 244/255, alpha: 1)
        } else if (colored == "red") {
            button.backgroundColor = UIColor.init(red: 226/255, green: 82/255, blue: 65/255, alpha: 1)
        } else if (colored == "green") {
            button.backgroundColor = UIColor.init(red: 151/255, green: 192/255, blue: 92/255, alpha: 1)
        } else if (colored == "yellow") {
            button.backgroundColor = UIColor.init(red: 253/255, green: 234/255, blue: 96/255, alpha: 1)
        } else if (colored == "black") {
            button.backgroundColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        }
        button.layer.cornerRadius = radius
        button.tintColor = UIColor.white
    }
    
    // Hollow button style
    static func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 18.0
        button.tintColor = UIColor.black
    }

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
