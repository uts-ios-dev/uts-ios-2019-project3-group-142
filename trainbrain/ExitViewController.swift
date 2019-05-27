//
//  ExitViewController.swift
//  trainbrain
//
//  Created by Imogen Thomson on 27/5/19.
//  Copyright © 2019 Sidney Cremer. All rights reserved.
//

import UIKit

class ExitViewController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    // UI components
    @IBOutlet weak var labelPlatformCheck: UILabel!
    @IBOutlet weak var pickerExit: UIPickerView!
    // Properties
    var station : Station!
    var platform : Platform!
    var availableExits : [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelPlatformCheck.text = "Platform \(platform.number), sweet!"
        
        getAvailableExits()
        
        self.pickerExit.delegate = self
        self.pickerExit.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return availableExits.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var labelPlatform : UILabel

        if let v = view as? UILabel {
            labelPlatform = v
        } else {
            labelPlatform = UILabel()
        }

        labelPlatform.textColor = UIColor.white
        labelPlatform.font = UIFont(name: "AvenirNext-Bold", size: 24.0)
        labelPlatform.textAlignment = .center
        labelPlatform.text = "\(availableExits[row].capitalized)"

        return labelPlatform
    }
    
    func getAvailableExits() {
        for exit in platform.exits {
            if (!availableExits.contains(exit.type.rawValue)) {
                availableExits.append(exit.type.rawValue)
            }
        }
    }
}
