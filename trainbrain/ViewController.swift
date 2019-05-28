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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let platformViewController = segue.destination as? PlatformViewController,
            let station = stationSearchField.selectedStation
            else {
                return
            }
        platformViewController.station = station
    }
}
