//
//  Utilities.swift
//  Countdown.io
//
//  Created by Max094_Reikeb on 26/11/2020.
//

import Foundation
import UIKit

extension UIButton {
    
    /// Filled rounded corner style
    func styleFilled(color: UIColor, radius: CGFloat) {
        self.backgroundColor = color
        self.layer.cornerRadius = radius
        self.tintColor = .white
    }
    
    /// Hollow rounded corner style
    func styleHollow() {
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        self.backgroundColor = .white
        self.layer.cornerRadius = 18.0
        self.tintColor = .black
    }

}

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
    
    // function to save a date with a key
    static func saveDate(dateKey: String, date: Date) {
        let components = Calendar.current.dateComponents([.second, .minute, .hour, .day, .year], from: date)
        Utilities.saveInt("yearUID", components.year!)
        Utilities.saveInt("dayUID", components.day!)
        Utilities.saveInt("hourUID", components.hour!)
        Utilities.saveInt("minUID", components.minute!)
        Utilities.saveInt("secUID", components.second!)
    }
    
    // function to get a date with a key
    static func getDate(dateKey: String) -> Date {
        var components = DateComponents()
        
        components.year = Utilities.getInt("yearUID")
        components.day = Utilities.getInt("dayUID")
        components.hour = Utilities.getInt("hourUID")
        components.minute = Utilities.getInt("minUID")
        components.second = Utilities.getInt("secUID")
        
        return Calendar.current.date(from: components)!
    }
}
