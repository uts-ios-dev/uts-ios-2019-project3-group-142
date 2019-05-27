//
//  PlatformViewController.swift
//  trainbrain
//
//  Created by Imogen Thomson on 26/5/19.
//  Copyright © 2019 Sidney Cremer. All rights reserved.
//

import UIKit

class PlatformViewController : UIViewController {
    // UI components
    @IBOutlet weak var labelStationCheck : UILabel!
    // Properties
    var station : Station!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelStationCheck.text = "\(station.name), huh?"
    }
}
