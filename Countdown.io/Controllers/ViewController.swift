//
//  ViewController.swift
//  Countdown.io
//
//  Created by Max094_Reikeb on 26/11/2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Setup random datas
    func setupRandom() {
        let isRandomSettedUp = Utilities.getBool("random")
        if (!isRandomSettedUp) {
            let randomYear = Int.random(in: 0...50)
            let randomDays = Int.random(in: 0...364)
            let randomHours = Int.random(in: 0...23)
            let randomMins = Int.random(in: 0...59)
            let randomSec = Int.random(in: 2...59)
            
            Utilities.saveInt("years", randomYear)
            Utilities.saveInt("days", randomDays)
            Utilities.saveInt("hours", randomHours)
            Utilities.saveInt("minutes", randomMins)
            Utilities.saveInt("seconds", randomSec)
            
            Utilities.saveBool("random", true)
        }
    }
}
