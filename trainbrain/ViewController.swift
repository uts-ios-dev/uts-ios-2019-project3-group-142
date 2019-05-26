//
//  ViewController.swift
//  trainbrain
//
//  Created by Sidney Cremer on 13/5/19.
//  Copyright © 2019 Sidney Cremer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Properties
    var stations = [Station]()
    let searchController = UISearchController(searchResultsController: nil)
    // UI components
    @IBOutlet weak var stationSearchField: StationSearchField!
    @IBOutlet weak var btnNext: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func searchTextField(_ sender: StationSearchField) {
    }
}

