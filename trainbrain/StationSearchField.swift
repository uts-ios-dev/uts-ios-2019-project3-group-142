//
//  StationSearchField.swift
//  trainbrain
//
//  Created by Imogen Thomson on 26/5/19.
//  Copyright © 2019 Sidney Cremer. All rights reserved.
//

import UIKit

class StationSearchField: UITextField, UITableViewDelegate, UITableViewDataSource {
    var dataList : [String] = []
    var tableView : UITableView?
    
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
            tableView.layer.cornerRadius = 5.0
            tableView.separatorColor = UIColor.lightGray
            tableView.backgroundColor = UIColor.white.withAlphaComponent(0.4)
            
            if self.isFirstResponder {
                superview?.bringSubviewToFront(self)
            }
            
            tableView.reloadData()
        }
    }
    
    func addData() {
        dataList.append(self.text!)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StationSearchFieldCell", for: indexPath) as UITableViewCell
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.text = dataList[indexPath.row]
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.text = dataList[indexPath.row]
        tableView.isHidden = true
        self.endEditing(true)
    }
    
    @objc open func textFieldDidChange(){
        addData()
        updateSearchTableView()
        
    }
    
    @objc open func textFieldDidBeginEditing() {
    }
    
    @objc open func textFieldDidEndEditing() {
    }
    
    @objc open func textFieldDidEndEditingOnExit() {
    }
}
