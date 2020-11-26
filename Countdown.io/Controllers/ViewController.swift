//
//  ViewController.swift
//  Countdown.io
//
//  Created by Max094_Reikeb on 26/11/2020.
//

import UIKit

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
        
        //Setup random datas
        setupRandom()
        
        //First refresh labels
        refreshLabels()
        
        //Timer
        scheduledTimerWithTimeInterval()
    }
    
    // MARK: Set the navigation bar in white
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
    
    // MARK: Setup random datas
    func setupRandom() {
        let isRandomSettedUp = Utilities.getBool("random")
        if (!isRandomSettedUp) {
            //Getting random numbers
            let randomYear = Int.random(in: 0...50)
            let randomDays = Int.random(in: 0...364)
            let randomHours = Int.random(in: 0...23)
            let randomMins = Int.random(in: 0...59)
            let randomSec = Int.random(in: 2...59)
            
            //Saving random numbers
            Utilities.saveInt("years", randomYear)
            Utilities.saveInt("days", randomDays)
            Utilities.saveInt("hours", randomHours)
            Utilities.saveInt("minutes", randomMins)
            Utilities.saveInt("seconds", randomSec)
            
            Utilities.saveBool("random", true)
            
            //Refresh labels
            refreshLabels()
        }
    }
    
    // MARK: Refreshing labels
    func refreshLabels() {
        if (Utilities.getInt("years") >= 10) {
            self.yearLabel.text! = "\(Utilities.getInt("years"))"
        } else {
            self.yearLabel.text! = "0\(Utilities.getInt("years"))"
            if (Utilities.getInt("years") == 0) {
                self.yearLabel.textColor = UIColor.red
                self.YRS.textColor = UIColor.red
            }
        }
        
        if (Utilities.getInt("days") >= 10) {
            self.dayLabel.text! = "\(Utilities.getInt("days"))"
        } else {
            self.dayLabel.text! = "0\(Utilities.getInt("days"))"
            if ((Utilities.getInt("years") == 0) && (Utilities.getInt("days") == 0)) {
                self.dayLabel.textColor = UIColor.red
                self.DAY.textColor = UIColor.red
            }
        }
        
        if (Utilities.getInt("hours") >= 10) {
            self.hourLabel.text! = "\(Utilities.getInt("hours"))"
        } else {
            self.hourLabel.text! = "0\(Utilities.getInt("hours"))"
            if ((Utilities.getInt("years") == 0) && (Utilities.getInt("days") == 0) && (Utilities.getInt("hours") == 0)) {
                self.hourLabel.textColor = UIColor.red
                self.HRS.textColor = UIColor.red
            }
        }
        
        if (Utilities.getInt("minutes") >= 10) {
            self.minuteLabel.text! = "\(Utilities.getInt("minutes"))"
        } else {
            self.minuteLabel.text! = "0\(Utilities.getInt("minutes"))"
            if ((Utilities.getInt("years") == 0) && (Utilities.getInt("days") == 0) && (Utilities.getInt("hours") == 0) && (Utilities.getInt("minutes") == 0)) {
                self.minuteLabel.textColor = UIColor.red
                self.MIN.textColor = UIColor.red
            }
        }
        
        if (Utilities.getInt("seconds") >= 10) {
            self.secondLabel.text! = "\(Utilities.getInt("seconds"))"
        } else {
            self.secondLabel.text! = "0\(Utilities.getInt("seconds"))"
            if ((Utilities.getInt("years") == 0) && (Utilities.getInt("days") == 0) && (Utilities.getInt("hours") == 0) && (Utilities.getInt("minutes") == 0) &&
                    (Utilities.getInt("seconds") == 0)) {
                self.secondLabel.textColor = UIColor.red
                self.SEC.textColor = UIColor.red
            }
        }
    }
    
    // MARK: Setup timers
    func scheduledTimerWithTimeInterval() {
        // Scheduling timer to call the function "updateCounting" with the interval of 1 second
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounting() {
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
        
        //Update labels
        refreshLabels()
    }
}
