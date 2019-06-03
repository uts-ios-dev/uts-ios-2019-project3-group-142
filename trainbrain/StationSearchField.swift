//
//  StationSearchField.swift
//  trainbrain
//
//  Created by Imogen Thomson on 26/5/19.
//  Copyright © 2019 Sidney Cremer. All rights reserved.
//

import UIKit
import FirebaseDatabase

class StationSearchField: UITextField, UITableViewDelegate, UITableViewDataSource {
    var dataList : [Station] = [Station]()
    var resultsList : [Station] = [Station]()
    var tableView : UITableView?
    var selectedStation : Station?
    
    override open func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        tableView?.removeFromSuperview()
    }
    
    override open func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        // Set the listeners
        self.addTarget(self, action: #selector(StationSearchField.textFieldDidChange), for: .editingChanged)
        self.addTarget(self, action: #selector(StationSearchField.textFieldDidBeginEditing), for: .editingDidBegin)
        self.addTarget(self, action: #selector(StationSearchField.textFieldDidEndEditing), for: .editingDidEnd)
        self.addTarget(self, action: #selector(StationSearchField.textFieldDidEndEditingOnExit), for: .editingDidEndOnExit)
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        buildSearchTableView()
    }
    
    func buildSearchTableView() {
        if let tableView = tableView {
            // tableView exists; set delegate and data then add to the view
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "StationSearchFieldCell")
            tableView.delegate = self
            tableView.dataSource = self
            self.window?.addSubview(tableView)
        } else {
            // Create the tableView
            if dataList.isEmpty {
                getData()
            }
            tableView = UITableView(frame: CGRect.zero)
        }
        
        updateSearchTableView()
    }
    
    func updateSearchTableView() {
        if let tableView = tableView {
            superview?.bringSubviewToFront(tableView)
            var tableHeight: CGFloat = 0
            tableHeight = tableView.contentSize.height
            
            if tableHeight < tableView.contentSize.height {
                tableHeight -= 10
            }
            
            var tableViewFrame = CGRect(x: 0, y: 0, width: frame.size.width - 4, height: tableHeight)
            tableViewFrame.origin = self.convert(tableViewFrame.origin, to: nil)
            tableViewFrame.origin.x += 2
            tableViewFrame.origin.y += frame.size.height + 2
            UIView.animate(withDuration: 0.2, animations: { [weak self] in
                self?.tableView?.frame = tableViewFrame
            })
            
            tableView.layer.masksToBounds = true
            tableView.separatorInset = UIEdgeInsets.zero
            tableView.separatorColor = UIColor.clear
            tableView.backgroundColor = UIColor.white.withAlphaComponent(0.4)
            
            if self.isFirstResponder {
                superview?.bringSubviewToFront(self)
            }
            
            tableView.reloadData()
        }
    }
    
    func getData() {
        let db = Database.database().reference().child("stations")
        
        db.observeSingleEvent(of: .value, with: { stationsSnapshot in
            for station in stationsSnapshot.children {
                let stationSnapshot = station as! DataSnapshot
                // Create platforms array for station
                var platformList = [Platform]()
                // Get this station's platforms
                for platform in stationSnapshot.childSnapshot(forPath: "platforms").children {
                    let platformSnapshot = platform as! DataSnapshot
                    // Create exits array for platform
                    var exitList = [Exit]()
                    // Get this platform's exits
                    for exit in platformSnapshot.childSnapshot(forPath: "exits").children {
                        let exitSnapshot = exit as! DataSnapshot
                        
                        if let exitValue = exitSnapshot.value as? [String: Any] {
                            // Create the exit object
                            exitList.append(Exit(type: ExitType(rawValue: exitValue["type"] as! String)!, carriageNumber: exitValue["carriage"] as! Int, doorNumber: exitValue["door"] as! Int))
                        }
                    }
                    // Create the platform object
                    platformList.append(Platform(number: Int(platformSnapshot.key)!, exits: exitList))
                }
                // Create station object
                self.dataList.append(Station(name: stationSnapshot.key, platforms: platformList))
            }
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StationSearchFieldCell", for: indexPath) as UITableViewCell
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.text = resultsList[indexPath.row].name
        cell.textLabel?.font = UIFont(name: "AvenirNext-Bold", size: 24.0)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedStation = resultsList[indexPath.row]
        self.text = resultsList[indexPath.row].name
        tableView.isHidden = true
        self.endEditing(true)
    }
    
    fileprivate func filter() {
        resultsList = []
        
        for i in 0 ..< dataList.count {
            let item = dataList[i]
            
            let filterRange = (item.name as NSString).range(of: text!, options: .caseInsensitive)
            
            if filterRange.location != NSNotFound {
                resultsList.append(item)
            }
        }
        
        tableView?.reloadData()
    }
    
    @objc open func textFieldDidChange(){
        selectedStation = nil
        filter()
        updateSearchTableView()
        tableView?.isHidden = false
    }
    
    @objc open func textFieldDidBeginEditing() {
    }
    
    @objc open func textFieldDidEndEditing() {
    }
    
    @objc open func textFieldDidEndEditingOnExit() {
    }
}
