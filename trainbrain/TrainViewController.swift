//
//  TrainViewController.swift
//  trainbrain
//
//  Created by Imogen Thomson on 28/5/19.
//  Copyright © 2019 Sidney Cremer. All rights reserved.
//

import UIKit
import CoreData

class TrainViewController : UIViewController {
    // UI components
    @IBOutlet weak var labelSummary : UILabel!
    var container: NSPersistentContainer!
    // Properties
    var station : Station!
    var platform : Platform!
    var exitType : ExitType!
    var chosenExits : [Exit] = [Exit]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getChosenExits()
        updateSummary()
    }
    
    func getChosenExits() {
        for exit in platform.exits {
            if exit.type == exitType {
                chosenExits.append(exit)
            }
        }
    }
    
    func updateSummary() {
        var exitSummary : [String] = [String]()
        
        for exit in chosenExits {
            exitSummary.append("carriage \(exit.carriageNumber), \(exit.doorNumber == 1 ? "1st" : "2nd") door")
        }
        
        
        labelSummary.text = "\(exitSummary.joined(separator: " and ").capitalizingFirstLetter()) will be closest to the \(exitType.rawValue) at \(station.name)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? ViewController {
            nextVC.container = container
        }
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
