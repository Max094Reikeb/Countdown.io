//
//  ViewController.swift
//  Countdown.io
//
//  Created by Max094_Reikeb on 26/11/2020.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var HRS: UILabel!
    @IBOutlet weak var DAY: UILabel!
    @IBOutlet weak var YRS: UILabel!
    @IBOutlet weak var MIN: UILabel!
    @IBOutlet weak var SEC: UILabel!
    
    var timer = Timer()
    
    // MARK: View load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Setup datas
        setupDatas()
        
        // First refresh labels
        refreshLabels()
        
        // Timer
        scheduledTimerWithTimeInterval()
    }
    
    // MARK: Set the navigation bar in white
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
    
    // MARK: Setup datas
    func setupDatas() {
        let isSettedUp = Utilities.getBool("settedup")
        if (!isSettedUp) {
            // Saving random numbers
            Utilities.saveInt("years", 0)
            Utilities.saveInt("days", 0)
            Utilities.saveInt("hours", 0)
            Utilities.saveInt("minutes", 0)
            Utilities.saveInt("seconds", 0)
            
            Utilities.saveBool("settedup", true)
            
            // Refresh labels
            refreshLabels()
            
        } else {
            // Get back the date
            let currentDate = Date()
            let selectorDate = Utilities.getDate("dateSelected")
            
            let calendar = Calendar.current
                
            let currentComponents = calendar.dateComponents([Calendar.Component.second, Calendar.Component.minute, Calendar.Component.hour, Calendar.Component.day, Calendar.Component.month, Calendar.Component.year], from: currentDate)
                
            let objectiveComponents = calendar.dateComponents([Calendar.Component.second, Calendar.Component.minute, Calendar.Component.hour, Calendar.Component.day, Calendar.Component.month, Calendar.Component.year], from: selectorDate)
                
            // Day difference
            // Replace the hour (time) of both dates with 00:00
            let date1 = calendar.startOfDay(for: currentDate)
            let date2 = calendar.startOfDay(for: selectorDate)

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
                
            // Second difference
            if (objectiveComponents.second! < currentComponents.second!) {
                Utilities.saveInt("seconds", (currentComponents.second! - objectiveComponents.second!))
            } else {
                Utilities.saveInt("seconds", (objectiveComponents.second! - currentComponents.second!))
            }
            
            // Refresh labels
            refreshLabels()
        }
    }
    
    // MARK: Refreshing labels
    func refreshLabels() {
        if (Utilities.getInt("years") >= 10) {
            self.yearLabel.text! = "\(Utilities.getInt("years"))"
            if (self.yearLabel.textColor != UIColor.white) {
                self.yearLabel.textColor = UIColor.white
                self.YRS.textColor = UIColor.white
            }
        } else {
            self.yearLabel.text! = "0\(Utilities.getInt("years"))"
            if (Utilities.getInt("years") == 0) {
                self.yearLabel.textColor = UIColor.red
                self.YRS.textColor = UIColor.red
            } else {
                self.yearLabel.textColor = UIColor.white
                self.YRS.textColor = UIColor.white
            }
        }
        
        if (Utilities.getInt("days") >= 10) {
            self.dayLabel.text! = "\(Utilities.getInt("days"))"
            if (self.dayLabel.textColor != UIColor.white) {
                self.dayLabel.textColor = UIColor.white
                self.DAY.textColor = UIColor.white
            }
        } else {
            self.dayLabel.text! = "0\(Utilities.getInt("days"))"
            if ((Utilities.getInt("years") == 0) && (Utilities.getInt("days") == 0)) {
                self.dayLabel.textColor = UIColor.red
                self.DAY.textColor = UIColor.red
            } else {
                self.dayLabel.textColor = UIColor.white
                self.DAY.textColor = UIColor.white
            }
        }
        
        if (Utilities.getInt("hours") >= 10) {
            self.hourLabel.text! = "\(Utilities.getInt("hours"))"
            if (self.hourLabel.textColor != UIColor.white) {
                self.hourLabel.textColor = UIColor.white
                self.HRS.textColor = UIColor.white
            }
        } else {
            self.hourLabel.text! = "0\(Utilities.getInt("hours"))"
            if ((Utilities.getInt("years") == 0) && (Utilities.getInt("days") == 0) && (Utilities.getInt("hours") == 0)) {
                self.hourLabel.textColor = UIColor.red
                self.HRS.textColor = UIColor.red
            } else {
                self.hourLabel.textColor = UIColor.white
                self.HRS.textColor = UIColor.white
            }
        }
        
        if (Utilities.getInt("minutes") >= 10) {
            self.minuteLabel.text! = "\(Utilities.getInt("minutes"))"
            if (self.minuteLabel.textColor != UIColor.white) {
                self.minuteLabel.textColor = UIColor.white
                self.MIN.textColor = UIColor.white
            }
        } else {
            self.minuteLabel.text! = "0\(Utilities.getInt("minutes"))"
            if ((Utilities.getInt("years") == 0) && (Utilities.getInt("days") == 0) && (Utilities.getInt("hours") == 0) && (Utilities.getInt("minutes") == 0)) {
                self.minuteLabel.textColor = UIColor.red
                self.MIN.textColor = UIColor.red
            } else {
                self.minuteLabel.textColor = UIColor.white
                self.MIN.textColor = UIColor.white
            }
        }
        
        if (Utilities.getInt("seconds") >= 10) {
            self.secondLabel.text! = "\(Utilities.getInt("seconds"))"
            if (secondLabel.textColor != UIColor.white) {
                self.secondLabel.textColor = UIColor.white
                self.SEC.textColor = UIColor.white
            }
        } else {
            self.secondLabel.text! = "0\(Utilities.getInt("seconds"))"
            if ((Utilities.getInt("years") == 0) && (Utilities.getInt("days") == 0) && (Utilities.getInt("hours") == 0) && (Utilities.getInt("minutes") == 0) &&
                    (Utilities.getInt("seconds") == 0)) {
                self.secondLabel.textColor = UIColor.red
                self.SEC.textColor = UIColor.red
            } else {
                self.secondLabel.textColor = UIColor.white
                self.SEC.textColor = UIColor.white
            }
        }
    }
    
    // MARK: Setup timer
    func scheduledTimerWithTimeInterval() {
        // Scheduling timer to call the function "updateCounting" with the interval of 1 second
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounting() {
        if ((Utilities.getInt("years") == 0) && (Utilities.getInt("days") == 0) && (Utilities.getInt("hours") == 0) && (Utilities.getInt("minutes") == 0) &&
                (Utilities.getInt("seconds") == 0)) {
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        } else {
            if (Utilities.getInt("years") >= 0) {
                if (Utilities.getInt("days") >= 0) {
                    if (Utilities.getInt("hours") >= 0) {
                        if (Utilities.getInt("minutes") >= 0) {
                            if (Utilities.getInt("seconds") > 0) {
                                (Utilities.saveInt("seconds", (Utilities.getInt("seconds") - 1)))
                            } else {
                                (Utilities.saveInt("minutes", (Utilities.getInt("minutes") - 1)))
                                (Utilities.saveInt("seconds", 59))
                            }
                        } else {
                            (Utilities.saveInt("hours", (Utilities.getInt("hours") - 1)))
                            (Utilities.saveInt("minutes", 59))
                        }
                    } else {
                        (Utilities.saveInt("days", (Utilities.getInt("days") - 1)))
                        (Utilities.saveInt("hours", 23))
                    }
                } else {
                    (Utilities.saveInt("years", (Utilities.getInt("years") - 1)))
                    (Utilities.saveInt("days", 364))
                }
            }
        }
        
        // Update labels
        refreshLabels()
    }
    
    func alertUser(_ title: String, _ message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
}
