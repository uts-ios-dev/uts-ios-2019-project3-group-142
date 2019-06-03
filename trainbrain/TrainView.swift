//
//  TrainView.swift
//  trainbrain
//
//  Created by Imogen Thomson on 2/6/19.
//  Copyright © 2019 Sidney Cremer. All rights reserved.
//

import UIKit

class TrainView : UIView {
    var exits : [Exit] = [Exit]()
    var train = [[Bool]]()
    
    override func draw(_ rect: CGRect) {
        generateTrainArray()
        
        let offset = 8
        var position = 1
        // The magic! Generate the train
        for (i, carriage) in train.enumerated() {
            for (j, door) in carriage.enumerated() {
                if (i == 0 && j == 0) {
                    // First door of whole train
                    let cgPath = createFirstCarriageDoor(position: CGFloat(position), offset: CGFloat(offset * i), width: 50, height: 30, radius: 8, lineWidth: 4)
                    let path = UIBezierPath(cgPath: cgPath)
                    // Style path
                    path.lineWidth = 4.0
                    path.lineCapStyle = .square
                    UIColor.white.setStroke()
                    path.stroke()
                    
                    if door {
                        UIColor.white.setFill()
                        path.fill()
                    }
                } else {
                    // Standard doors
                    if j == 0 {
                        // First door of carriage
                        let cgPath = createCarriageDoor1(position: CGFloat(position), offset: CGFloat(offset * i), width: 50, height: 30, lineWidth: 4)
                        let path = UIBezierPath(cgPath: cgPath)
                        path.lineWidth = 4.0
                        path.lineCapStyle = .square
                        UIColor.white.setStroke()
                        path.stroke()
                        
                        if door {
                            UIColor.white.setFill()
                            path.fill()
                        }
                    } else {
                        // Second door of carriage
                        let cgPath = createCarriageDoor2(position: CGFloat(position), offset: CGFloat(offset * i), width: 50, height: 30, lineWidth: 4)
                        let path = UIBezierPath(cgPath: cgPath)
                        path.lineWidth = 4.0
                        path.lineCapStyle = .square
                        UIColor.white.setStroke()
                        path.stroke()
                        
                        if door {
                            UIColor.white.setFill()
                            path.fill()
                        }
                    }
                }
                
                // Iterate the drawing position
                position += 1
            }
        }
    }
    
    // First door of whole train
    func createFirstCarriageDoor(position: CGFloat, offset: CGFloat, width: CGFloat, height: CGFloat, radius: CGFloat, lineWidth: CGFloat) -> CGPath {
        let point1 = CGPoint(x: (lineWidth / 2), y: (height * position) + offset)
        let point2 = CGPoint(x: (lineWidth / 2), y: ((height * position) - height / 6) + offset)
        let point3 = CGPoint(x: width / 2, y: (height * (position - 1)) + offset)
        let point4 = CGPoint(x: width - (lineWidth / 2), y: ((height * position) - (height / 6)) + offset)
        let point5 = CGPoint(x: width - (lineWidth / 2), y: (height * position) + offset)
        
        let path = CGMutablePath()
        path.move(to: point1)
        path.addLine(to: point2)
        path.addArc(tangent1End: point2, tangent2End: point3, radius: radius)
        path.addArc(tangent1End: point3, tangent2End: point4, radius: radius)
        path.addLine(to: point4)
        path.addLine(to: point5)
        
        return path
    }
    
    // Outline of front half of carriage
    func createCarriageDoor1(position: CGFloat, offset: CGFloat, width: CGFloat, height: CGFloat, lineWidth: CGFloat) -> CGPath {
        let point1 = CGPoint(x: (lineWidth / 2), y: (height * position) + offset)
        let point2 = CGPoint(x: (lineWidth / 2), y: (height * (position - 1)) + offset)
        let point3 = CGPoint(x: width - (lineWidth / 2), y: (height * (position - 1)) + offset)
        let point4 = CGPoint(x: width - (lineWidth / 2), y: (height * position) + offset)
        
        let path = CGMutablePath()
        path.move(to: point1)
        path.addLine(to: point2)
        path.addLine(to: point3)
        path.addLine(to: point4)
        
        return path
    }
    
    // Outline of back half of carriage
    func createCarriageDoor2(position: CGFloat, offset: CGFloat, width: CGFloat, height: CGFloat, lineWidth: CGFloat) -> CGPath {
        let point1 = CGPoint(x: (lineWidth / 2), y: (height * (position - 1)) + offset)
        let point2 = CGPoint(x: (lineWidth / 2), y: (height * position) + offset)
        let point3 = CGPoint(x: width - (lineWidth / 2), y: (height * position) + offset)
        let point4 = CGPoint(x: width - (lineWidth / 2), y: (height * (position - 1)) + offset)
        
        let path = CGMutablePath()
        path.move(to: point1)
        path.addLine(to: point2)
        path.addLine(to: point3)
        path.addLine(to: point4)
        
        return path
    }
    
    func generateTrainArray() {
        for _ in 1...8 {
            train.append([false, false])
        }
        
        for exit in exits {
            train[exit.carriageNumber - 1][exit.doorNumber - 1] = true
        }
    }
}
