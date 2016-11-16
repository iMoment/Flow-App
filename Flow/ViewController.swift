//
//  ViewController.swift
//  Flow
//
//  Created by Stanley Pan on 16/11/2016.
//  Copyright © 2016 Stanley Pan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterLabel.text = String(counterView.counter)
    }
    
    @IBAction func pushButtonPressed(button: PushButtonView) {
        if button.isAddButton {
            counterView.counter += 1
        } else {
            if counterView.counter > 0 {
                counterView.counter -= 1
            }
        }
        counterLabel.text = String(counterView.counter)
    }
}
