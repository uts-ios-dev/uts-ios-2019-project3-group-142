//
//  ExitViewController.swift
//  trainbrain
//
//  Created by Imogen Thomson on 27/5/19.
//  Copyright © 2019 Sidney Cremer. All rights reserved.
//

import UIKit
import CoreData

class ExitViewController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    // UI components
    @IBOutlet weak var labelPlatformCheck: UILabel!
    @IBOutlet weak var pickerExit: UIPickerView!
    // Properties
    var station : Station!
    var platform : Platform!
    var availableExits : [ExitType] = [ExitType]()
    var selectedExitType : ExitType!
    var container: NSPersistentContainer!
    
    
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
    
    // Change the height of the picker view row to be more inline with style
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 48.0
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var labelPlatform : UILabel

        if let v = view as? UILabel {
            labelPlatform = v
        } else {
            labelPlatform = UILabel()
        }

        labelPlatform.textColor = UIColor.black
        labelPlatform.font = UIFont(name: "AvenirNext-Bold", size: 36.0)
        labelPlatform.textAlignment = .left
        labelPlatform.text = "\(availableExits[row].rawValue.capitalized)"

        return labelPlatform
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedExitType = availableExits[row]
    }
    
    func getAvailableExits() {
        for exit in platform.exits {
            if (!availableExits.contains(exit.type)) {
                availableExits.append(exit.type)
            }
        }
        
        // Set the default selection
        selectedExitType = availableExits[0]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let trainViewController = segue.destination as? TrainViewController
            else {
                return
        }
        if let nextVC = segue.destination as? TrainViewController {
            nextVC.container = container
        }
        trainViewController.station = station
        trainViewController.platform = platform
        trainViewController.exitType = selectedExitType
    }
}
