//
//  ViewController.swift
//  McDonald's
//
//  Created by Kryg Tomasz on 18.10.2017.
//  Copyright © 2017 Kryg Tomek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainImageView: UIImageView! {
        didSet {
            mainImageView.image = #imageLiteral(resourceName: "mainImage")
        }
    }
    @IBOutlet weak var timerView: UIView! {
        didSet {
            timerView.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        }
    }
    @IBOutlet weak var timerLabel: UILabel! {
        didSet {
            timerLabel.text = "04:59"
        }
    }
    @IBOutlet weak var dayLabel: UILabel! {
        didSet {
            dayLabel.text = "20"
            dayLabel.addShadow()
        }
    }
    @IBOutlet weak var monthLabel: UILabel! {
        didSet {
            monthLabel.text = "PAŹ"
            monthLabel.addShadow()
        }
    }
    
    var timer: Timer!
    var min = 4
    var sec = 59
    var date: Date = Date() {
        didSet {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "pl_PL")
            dateFormatter.dateFormat = "dd"
            let day = dateFormatter.string(from: date)
            dateFormatter.dateFormat = "MMM"
            let month = dateFormatter.string(from: date).uppercased()
            dayLabel.text = day
            monthLabel.text = month
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        date = Date()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }

    @objc func update() {
        sec += -1
        if sec == -1 {
            sec = 59
            min += -1
        }
        if min == -1 {
            min = 0
            sec = 0
        }
        if sec < 10 {
            timerLabel.text = "0\(min):0\(sec)"
        } else {
            timerLabel.text = "0\(min):\(sec)"
        }
    }

}


