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
    @IBOutlet weak var labelStationCheck: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func searchTextField(_ sender: StationSearchField) {
    }
    
    @IBAction func onClick(_ sender: Any) {
        print(stationSearchField.selectedStation?.name ?? "<station>")
//        labelStationCheck.text = (stationSearchField.selectedStation?.name ?? "<station>") + ", huh?"
    }
}

