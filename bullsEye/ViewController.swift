//
//  ViewController.swift
//  bullsEye
//
//  Created by 김민우 on 29/03/2019.
//  Copyright © 2019 김민우. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 50
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewRound()
    }

    @IBAction func showAlert(_ sender: UIButton) {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        }
        else if difference < 5 {
            title = "You almost had it"
            if difference == 1 {
                points += 50
            }
        }
        else if difference < 10 {
            title = "Pretty good!"
        }
        else {
            title = "Not even close..."
        }

        score += points
        
        let message = "You scored \(points) points"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "O.K", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        print("The value of the slider is now \(currentValue)")
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in:1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
}
