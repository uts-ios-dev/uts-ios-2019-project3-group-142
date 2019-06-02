//
//  TrainBrainTheme.swift
//  trainbrain
//
//  Created by Imogen Thomson on 25/5/19.
//  Copyright © 2019 Sidney Cremer. All rights reserved.
//

import UIKit

extension UIColor {
    static let trainBrainCream = UIColor(red: 235.0/255.0, green: 216.0/255.0, blue: 195.0/255.0, alpha: 1.0);
    static let trainBrainOrange = UIColor(red: 255.0/255.0, green: 124.0/255.0, blue: 59.0/255.0, alpha: 1.0);
    static let trainBrainRed = UIColor(red: 224.0/255.0, green: 62.0/255.0, blue: 54.0/255.0, alpha: 1.0);
    static let trainBrainPink = UIColor(red: 184.0/255.0, green: 13.0/255.0, blue: 87.0/255.0, alpha: 1.0);
    static let trainBrainPurple = UIColor(red: 112.0/255.0, green: 9.0/255.0, blue: 97.0/255.0, alpha: 1.0);
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
