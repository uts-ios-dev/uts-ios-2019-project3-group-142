//
//  PlatformViewController.swift
//  trainbrain
//
//  Created by Imogen Thomson on 26/5/19.
//  Copyright © 2019 Sidney Cremer. All rights reserved.
//

import UIKit

class PlatformViewController : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    // UI components
    @IBOutlet weak var labelStationCheck : UILabel!
    @IBOutlet weak var pickerPlatform: UIPickerView!
    // Properties
    var station : Station!
    var selectedPlatform : Platform?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectedPlatform = station.platforms[0]
        labelStationCheck.text = "\(station.name), huh?"
        
        self.pickerPlatform.delegate = self
        self.pickerPlatform.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return station.platforms.count
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
        labelPlatform.text = "Platform \(station.platforms[row].number)"
        
        return labelPlatform
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedPlatform = station.platforms[row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let exitViewController = segue.destination as? ExitViewController
            else {
                return
            }
        
        exitViewController.station = station
        exitViewController.platform = selectedPlatform
    }
}
