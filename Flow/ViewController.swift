//
//  ViewController.swift
//  Flow
//
//  Created by Stanley Pan on 16/11/2016.
//  Copyright © 2016 Stanley Pan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isGraphViewShowing = false

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var graphView: GraphView!
    @IBOutlet weak var averageWaterDrunk: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    
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
        
        if isGraphViewShowing {
            counterViewTap(nil)
        }
    }
    
    @IBAction func counterViewTap(_ sender: UITapGestureRecognizer?) {
        
        if isGraphViewShowing {
            UIView.transition(from: graphView, to: counterView, duration: 1.0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        } else {
            // Show graph
            UIView.transition(from: counterView, to: graphView, duration: 1.0, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
        }
        
        isGraphViewShowing = !isGraphViewShowing
    }
    
    func setupGraphDisplay() {
        let numberOfDays: Int = 7
        
        // Replace last day with today's actual data
        graphView.graphPoints[graphView.graphPoints.count - 1] = counterView.counter
        
        // Graph needs to be redrawn
        graphView.setNeedsDisplay()
        
        maxLabel.text = "\(graphView.graphPoints.max())"
        
        // Average graphPoints
        let average = graphView.graphPoints.reduce(0, +) / graphView.graphPoints.count
        averageWaterDrunk.text = "\(average)"
        
        //set up labels
        //day of week labels are set up in storyboard with tags
        //today is last day of the array need to go backwards
        
        //4 - get today's day number
        let dateFormatter = DateFormatter()
        let calendar = Calendar.current
        let componentOptions: Calendar.Component = .weekday
        
        let components = calendar.component(componentOptions, from: Date())
        var weekday = components
        
        let days = ["S", "S", "M", "T", "W", "T", "F"]
        
        for i in (1...days.count).reversed() {
            if let labelView = graphView.viewWithTag(i) as? UILabel {
                if weekday == 7 {
                    weekday = 0
                }
//                labelView.text = days[weekday -= 1]
            }
        }
        //5 - set up the day name labels with correct day
//        for i in (1...days.count).reversed() {
//            if let labelView = graphView.viewWithTag(i) as? UILabel {
//                if weekday == 7 {
//                    weekday = 0
//                }
//                labelView.text = days[weekday -= 1]
//                if weekday < 0 {
//                    weekday = days.count - 1
//                }
//            }
//        }
    }
}





























