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
    
    var timer = Timer()
    
    // MARK: View load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Setup random datas
        setupRandom()
        
        //First refresh labels
        refreshLabels()
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
        if (Utilities.getInt("years") > 10) {
            self.yearLabel.text! = "\(Utilities.getInt("years"))"
        } else {
            self.yearLabel.text! = "0\(Utilities.getInt("years"))"
        }
        
        if (Utilities.getInt("days") > 10) {
            self.dayLabel.text! = "\(Utilities.getInt("days"))"
        } else {
            self.dayLabel.text! = "\(Utilities.getInt("days"))"
        }
        
        if (Utilities.getInt("hours") > 10) {
            self.hourLabel.text! = "\(Utilities.getInt("hours"))"
        } else {
            self.hourLabel.text! = "\(Utilities.getInt("hours"))"
        }
        
        if (Utilities.getInt("minutes") > 10) {
            self.minuteLabel.text! = "\(Utilities.getInt("minutes"))"
        } else {
            self.minuteLabel.text! = "\(Utilities.getInt("minutes"))"
        }
        
        if (Utilities.getInt("seconds") > 10) {
            self.secondLabel.text! = "\(Utilities.getInt("seconds"))"
        } else {
            self.secondLabel.text! = "\(Utilities.getInt("seconds"))"
        }
    }
    
    // MARK: Setup timers
    func scheduledTimerWithTimeInterval() {
        // Scheduling timer to call the function "updateCounting" with the interval of 1 second
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounting() {
    }
}
