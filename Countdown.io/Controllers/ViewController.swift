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
    
    var years = 0
    var days = 0
    var hours = 0
    var minutes = 0
    var seconds = 0
    
    var timer = Timer()
    
    // MARK: View load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Setup display & datas
        overrideUserInterfaceStyle = .dark
        
        // Timer
        scheduledTimerWithTimeInterval()
    }
    
    // MARK: Refreshing labels
    func refreshLabels() {
        if years >= 10 {
            self.yearLabel.text = "\(years)"
            if self.yearLabel.textColor != .white {
                self.yearLabel.textColor = .white
                self.YRS.textColor = .white
            }
        } else {
            self.yearLabel.text = "0\(years)"
            if years == 0 {
                self.yearLabel.textColor = .red
                self.YRS.textColor = .red
            } else {
                self.yearLabel.textColor = .white
                self.YRS.textColor = .white
            }
        }
        
        if days >= 10 {
            self.dayLabel.text = "\(days)"
            if self.dayLabel.textColor != .white {
                self.dayLabel.textColor = .white
                self.DAY.textColor = .white
            }
        } else {
            self.dayLabel.text = "0\(days)"
            if years == 0 && days == 0 {
                self.dayLabel.textColor = .red
                self.DAY.textColor = .red
            } else {
                self.dayLabel.textColor = .white
                self.DAY.textColor = .white
            }
        }
        
        if hours >= 10 {
            self.hourLabel.text = "\(hours)"
            if self.hourLabel.textColor != .white {
                self.hourLabel.textColor = .white
                self.HRS.textColor = .white
            }
        } else {
            self.hourLabel.text = "0\(hours)"
            if years == 0 && days == 0 && hours == 0 {
                self.hourLabel.textColor = .red
                self.HRS.textColor = .red
            } else {
                self.hourLabel.textColor = .white
                self.HRS.textColor = .white
            }
        }
        
        if minutes >= 10 {
            self.minuteLabel.text = "\(minutes)"
            if (self.minuteLabel.textColor != .white) {
                self.minuteLabel.textColor = .white
                self.MIN.textColor = .white
            }
        } else {
            self.minuteLabel.text = "0\(minutes)"
            if years == 0 && days == 0 && hours == 0 && minutes == 0 {
                self.minuteLabel.textColor = .red
                self.MIN.textColor = .red
            } else {
                self.minuteLabel.textColor = .white
                self.MIN.textColor = .white
            }
        }
        
        if seconds >= 10 {
            self.secondLabel.text = "\(seconds)"
            if (secondLabel.textColor != .white) {
                self.secondLabel.textColor = .white
                self.SEC.textColor = .white
            }
        } else {
            self.secondLabel.text = "0\(seconds)"
            if years == 0 && days == 0 && hours == 0 && minutes == 0 && seconds == 0 {
                self.secondLabel.textColor = .red
                self.SEC.textColor = .red
            } else {
                self.secondLabel.textColor = .white
                self.SEC.textColor = .white
            }
        }
    }
    
    // MARK: Setup timer
    func scheduledTimerWithTimeInterval() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounting() {
        // Get back the date
        let selectedDate = UIDatePicker().getFromUserDefaults(getKey: "selectedDate")
        
        let components = Calendar.current.dateComponents([.second, .minute, .hour, .day, .year], from: Date(), to: selectedDate)
        
        years = components.year ?? 0
        days = components.day ?? 0
        hours = components.hour ?? 0
        minutes = components.minute ?? 0
        seconds = components.second ?? 0
        
        years != 0 || days != 0 || hours != 0 || minutes != 0 || seconds != 0 ? refreshLabels() : AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
}
