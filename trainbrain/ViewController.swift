//
//  ViewController.swift
//  trainbrain
//
//  Created by Sidney Cremer on 13/5/19.
//  Copyright © 2019 Sidney Cremer. All rights reserved.
//

import UIKit
import SQLite3

class ViewController : UIViewController {
    // UI components
    @IBOutlet weak var stationSearchField : StationSearchField!
    @IBOutlet weak var btnNext : UIButton!
    var db: OpaquePointer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var nameList: [String] = []
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
        //the database file
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("StationDB.db.sql")
        
        //opening the database
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
        
        
        //this is our select query
        let queryString = "SELECT name FROM StationEntity"
        
        //statement pointer
        var stmt:OpaquePointer?
        
        //preparing the query
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        //traversing through all the records
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let name = sqlite3_column_int(stmt, 0)
            
            //adding values to list
            nameList.append(String(describing: name))
        }
        
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

