//
//  CounterView.swift
//  Flow
//
//  Created by Stanley Pan on 16/11/2016.
//  Copyright © 2016 Stanley Pan. All rights reserved.
//

import UIKit
@IBDesignable

class CounterView: UIView {
    
    let numberOfGlasses = 8
    let pi: CGFloat = CGFloat(M_PI)
    
    @IBInspectable var counter: Int = 5 {
        didSet {
            if counter <= numberOfGlasses {
                setNeedsDisplay()
            }
        }
    }
    
    @IBInspectable var outlineColor: UIColor = .blue
    @IBInspectable var counterColor: UIColor = .orange

    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: bounds.width/2, y: bounds.height/2)
        let radius: CGFloat = max(bounds.width, bounds.height)
        let arcWidth: CGFloat = 76
        let startAngle: CGFloat = 3 * pi / 4
        let endAngle: CGFloat = pi / 4
        
        let path = UIBezierPath(arcCenter: center, radius: radius/2 - arcWidth/2, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        path.lineWidth = arcWidth
        counterColor.setStroke()
        path.stroke()
        
        let angleDifference: CGFloat = 2 * pi - startAngle + endAngle
        let arcLengthPerGlass = angleDifference / CGFloat(numberOfGlasses)
        let outlineEndAngle = arcLengthPerGlass * CGFloat(counter) + startAngle
        
        // Outer Arc
        let outlinePath = UIBezierPath(arcCenter: center, radius: bounds.width/2 - 2.5, startAngle: startAngle, endAngle: outlineEndAngle, clockwise: true)
        
        // Inner Arc
        outlinePath.addArc(withCenter: center, radius: bounds.width/2 - arcWidth + 2.5, startAngle: outlineEndAngle, endAngle: startAngle, clockwise: false)
        
        outlinePath.close()
        outlineColor.setStroke()
        outlinePath.lineWidth = 5.0
        outlinePath.stroke()
    }
}
