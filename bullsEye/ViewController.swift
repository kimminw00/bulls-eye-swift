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
    
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewRound()
    }

    @IBAction func showAlert(_ sender: UIButton) {
        let message = "The value of the slider is: \(currentValue)"
        let alert = UIAlertController(title: "Hello World", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        print("The value of the slider is now  \(currentValue)")
    }
    
    func updateLabels() {
        targetLabel.text = String(currentValue)
    }
    
    func startNewRound() {
        targetValue = Int.random(in:1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
}
