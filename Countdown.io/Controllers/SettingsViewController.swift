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
    }
    
    @IBAction func confirmAction(_ sender: Any) {
        let currentDate = Date()
        if (self.dateSelector.date <= currentDate) {
            alertUser("Error", "The date you entered must be past the current date")
        } else {
            let calendar = Calendar.current
            
            let currentComponents = calendar.dateComponents([Calendar.Component.second, Calendar.Component.minute, Calendar.Component.hour, Calendar.Component.day, Calendar.Component.year], from: currentDate)
            
            let objectiveComponents = calendar.dateComponents([Calendar.Component.second, Calendar.Component.minute, Calendar.Component.hour, Calendar.Component.day, Calendar.Component.year], from: self.dateSelector.date)
            
            Utilities.saveInt("years", (objectiveComponents.year! - currentComponents.year!))
            Utilities.saveInt("days", (objectiveComponents.day! - currentComponents.day!))
            Utilities.saveInt("hours", (objectiveComponents.hour! - currentComponents.hour!))
            Utilities.saveInt("minutes", (objectiveComponents.minute! - currentComponents.minute!))
            Utilities.saveInt("seconds", (objectiveComponents.second! - currentComponents.second!))
        }
    }
    
    func alertUser(_ title: String, _ message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
}
