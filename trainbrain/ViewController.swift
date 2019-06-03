//
//  ViewController.swift
//asd   trainbrain
//
//  Created by Sidney Cremer on 13/5/19.
//  Copyright © 2019 Sidney Cremer. All rights reserved.
//

import UIKit
import CoreData

class ViewController : UIViewController {
    // UI components
    @IBOutlet weak var stationSearchField : StationSearchField!
    @IBOutlet weak var btnNext : UIButton!
    
     var container: NSPersistentContainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }

    @objc func dismissKeyboard() {
        stationSearchField.resignFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let platformViewController = segue.destination as? PlatformViewController,
            let station = stationSearchField.selectedStation
            else {
                return
            }
        platformViewController.station = station
        if let nextVC = segue.destination as? PlatformViewController {
            nextVC.container = container
        }
    }
    
    
    @IBAction func onStationSearchFieldChanged(_ sender: Any) {
        if (stationSearchField.selectedStation == nil) {
            btnNext.isEnabled = false
            btnNext.backgroundColor = UIColor.lightText
        } else {
            btnNext.isEnabled = true
            btnNext.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func unwind(_ sender: UIStoryboardSegue) {}
    
    @IBAction func unwindToRestart(segue: UIStoryboardSegue) {
        stationSearchField.selectedStation = nil
        btnNext.isEnabled = false
        btnNext.backgroundColor = UIColor.lightText
        stationSearchField.text = ""
    }
}

