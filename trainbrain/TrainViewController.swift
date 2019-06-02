//
//  TrainViewController.swift
//  trainbrain
//
//  Created by Imogen Thomson on 28/5/19.
//  Copyright © 2019 Sidney Cremer. All rights reserved.
//
import UIKit

class TrainViewController : UIViewController {
    
    // UI components
    @IBOutlet weak var labelSummary : UILabel!
    @IBOutlet weak var trainDisplay : TrainView!
    
    // Properties
    var station : Station!
    var platform : Platform!
    var exitType : ExitType!
    var chosenExits : [Exit] = [Exit]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getChosenExits()
        trainDisplay.exits = chosenExits
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
    
    @IBAction func restart(_ sender: Any) {
        performSegue(withIdentifier: "unwindToRestart", sender: self)
    }
}
