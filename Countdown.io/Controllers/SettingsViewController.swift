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
        
        overrideUserInterfaceStyle = .dark
        setupElements()
    }

    func setupElements() {
        confirmButton.styleFilled(color: .red, radius: 18.0)
    }

    @IBAction func confirmAction(_ sender: Any) {
        if (self.dateSelector.date <= Date()) {
            let alert = UIAlertController(title: "Error", message: "The selected date must be past the current date", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
        } else {
            
            // Save the date
            self.dateSelector.saveUserDefaults(saveKey: "selectedDate")
            
            // Dismiss
            self.dismiss(animated: true)
        }
    }
}
