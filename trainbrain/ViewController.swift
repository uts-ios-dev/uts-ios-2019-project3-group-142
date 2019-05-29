//
//  ViewController.swift
//  trainbrain
//
//  Created by Sidney Cremer on 13/5/19.
//  Copyright © 2019 Sidney Cremer. All rights reserved.
//

import UIKit

class ViewController : UIViewController {
    // UI components
    @IBOutlet weak var stationSearchField : StationSearchField!
    @IBOutlet weak var btnNext : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func searchTextField(_ sender: StationSearchField) {
    }
    
    @IBAction func onBtnNextPressed(_ sender: Any) {
        if (stationSearchField.selectedStation == nil) {
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let platformViewController = segue.destination as? PlatformViewController,
            let station = stationSearchField.selectedStation
            else {
                return
            }
        platformViewController.station = station
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
}

