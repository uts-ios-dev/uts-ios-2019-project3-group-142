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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: Move and read from file
        stations = [
            Station(name: "Rockdale", platforms: [
                Platform(number: 2, exits: [
                    Exit(type: .stairs, carriageNumber: 5, doorNumber: 2),
                    Exit(type: .elevator, carriageNumber: 7, doorNumber: 1)
                ]),
                Platform(number: 3, exits: [
                    Exit(type: .stairs, carriageNumber: 3, doorNumber: 2),
                    Exit(type: .elevator, carriageNumber: 2, doorNumber: 2)
                ]),
                Platform(number: 4, exits: [
                    Exit(type: .stairs, carriageNumber: 5, doorNumber: 2),
                    Exit(type: .elevator, carriageNumber: 7, doorNumber: 1)
                ]),
                Platform(number: 5, exits: [
                    Exit(type: .stairs, carriageNumber: 3, doorNumber: 2),
                    Exit(type: .elevator, carriageNumber: 2, doorNumber: 2)
                ])
            ]),
            Station(name: "Kogarah", platforms: [
                Platform(number: 1, exits: [
                    Exit(type: .stairs, carriageNumber: 8, doorNumber: 2),
                    Exit(type: .elevator, carriageNumber: 8, doorNumber: 2)
                ]),
                Platform(number: 2, exits: [
                    Exit(type: .stairs, carriageNumber: 2, doorNumber: 1),
                    Exit(type: .elevator, carriageNumber: 1, doorNumber: 1)
                ]),
                Platform(number: 3, exits: [
                    Exit(type: .stairs, carriageNumber: 7, doorNumber: 2),
                    Exit(type: .elevator, carriageNumber: 8, doorNumber: 2)
                ]),
                Platform(number: 4, exits: [
                    Exit(type: .stairs, carriageNumber: 1, doorNumber: 2),
                    Exit(type: .elevator, carriageNumber: 1, doorNumber: 1)
                ])
            ])
        ]
    }

    
}

