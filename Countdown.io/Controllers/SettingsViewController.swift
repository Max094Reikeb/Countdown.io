//
//  SettingsViewController.swift
//  Countdown.io
//
//  Created by Max094_Reikeb on 27/11/2020.
//

import UIKit
import Foundation

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var confirmButton: UIButton!
    
    @IBOutlet weak var dateSelector: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupElements()
    }

    func setupElements() {
        Utilities.styleFilledButton(confirmButton, "red", 18.0)
        dateSelector.tintColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    }

    @IBAction func confirmAction(_ sender: Any) {
        let currentDate = Date()
        if (self.dateSelector.date <= currentDate) {
            alertUser("Error", "The date you entered must be past the current date")
        } else {
            
            // Save the date
            Utilities.saveDate("dateSelected", self.dateSelector.date)
            
            let calendar = Calendar.current
            
            let currentComponents = calendar.dateComponents([Calendar.Component.second, Calendar.Component.minute, Calendar.Component.hour, Calendar.Component.day, Calendar.Component.month, Calendar.Component.year], from: currentDate)
            
            let objectiveComponents = calendar.dateComponents([Calendar.Component.second, Calendar.Component.minute, Calendar.Component.hour, Calendar.Component.day, Calendar.Component.month, Calendar.Component.year], from: self.dateSelector.date)
            
            // Day difference
            // Replace the hour (time) of both dates with 00:00
            let date1 = calendar.startOfDay(for: currentDate)
            let date2 = calendar.startOfDay(for: self.dateSelector.date)

            let components = calendar.dateComponents([.day], from: date1, to: date2)
            
            Utilities.saveInt("days", components.day!)
            
            // Year difference
            if (components.day! > 366 && Utilities.isLeapYear(objectiveComponents.year!)) {
                Utilities.saveInt("years", Int(floor(Double(components.day! / 366))))
            } else if (components.day! > 365) {
                Utilities.saveInt("years", Int(floor(Double(components.day! / 365))))
            } else {
                Utilities.saveInt("years", 0)
            }
            
            // Hour difference
            if (objectiveComponents.hour! < currentComponents.hour!) {
                Utilities.saveInt("hours", (24 - currentComponents.hour!))
            } else {
                Utilities.saveInt("hours", (objectiveComponents.hour! - currentComponents.hour!))
            }
            
            // Minute difference
            if (objectiveComponents.minute! < currentComponents.minute!) {
                Utilities.saveInt("minutes", (60 - currentComponents.minute!))
            } else {
                Utilities.saveInt("minutes", (objectiveComponents.minute! - currentComponents.minute!))
            }
            
            // Setup seconds
            Utilities.saveInt("seconds", 59)
            
            // Dismiss
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func alertUser(_ title: String, _ message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}
