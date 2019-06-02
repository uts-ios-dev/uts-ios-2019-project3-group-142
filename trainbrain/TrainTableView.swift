//
//  Train.swift
//  trainbrain
//
//  Created by Imogen Thomson on 31/5/19.
//  Copyright © 2019 Sidney Cremer. All rights reserved.
//

import UIKit

class TrainTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    var exits : [Exit]!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // Eight carriages
        return 8
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Two doors
        return 2
    }
    
    // Carriage cells
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Door \(section)"
    }
    
    // Door cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarriageDoorCell", for: indexPath) as UITableViewCell
        // Draw the carriage half
        cell.backgroundColor = UIColor.clear
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 4
        cell.layer.cornerRadius = 4
        cell.textLabel?.text = "\(indexPath.section).\(indexPath.row)"
        cell.textLabel?.textColor = UIColor.white
        return cell
    }
}
