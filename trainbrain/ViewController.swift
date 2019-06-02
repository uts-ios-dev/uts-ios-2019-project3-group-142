//
//  ViewController.swift
//asd   trainbrain
//
//  Created by Sidney Cremer on 13/5/19.
//  Copyright © 2019 Sidney Cremer. All rights reserved.
//

import UIKit
import CoreData

class ViewController : UIViewController {
    // UI components
    @IBOutlet weak var stationSearchField : StationSearchField!
    @IBOutlet weak var btnNext : UIButton!
    
     var container: NSPersistentContainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storeData()
        getData()
//        guard container != nil else {
//            fatalError("This view needs a persistent container.")
//        }          
        
        
    }

    
    @IBAction func searchTextField(_ sender: StationSearchField) {
    }
    
    @IBAction func onBtnNextPressed(_ sender: Any) {
        if (stationSearchField.selectedStation == nil) {
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let platformViewController = segue.destination as? PlatformViewController,
            let station = stationSearchField.selectedStation
            else {
                return
            }
        platformViewController.station = station
        if let nextVC = segue.destination as? PlatformViewController {
            nextVC.container = container
        }
    }
    
    @IBAction func unwind(_ sender: UIStoryboardSegue) {}

    func storeData() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let station = NSEntityDescription.entity(forEntityName: "StationEntity", in: context)!
        let platforms = NSEntityDescription.entity(forEntityName: "PlatformEntity", in: context)!
        
        
        let summerHill = NSManagedObject(entity: station, insertInto: context)
        
        let summerHillPlatform1 = NSManagedObject(entity: platforms, insertInto: context)
        
        
        
        
        let lewisham = NSManagedObject(entity: station, insertInto: context)
        let petersham = NSManagedObject(entity: station, insertInto: context)
        let stanmore = NSManagedObject(entity: station, insertInto: context)
        let newtown = NSManagedObject(entity: station, insertInto: context) 	
        
        summerHill.setValue("Summer Hill", forKey: "name")
        summerHill.setValue(3, forKey: "platforms")
//        summerHill.setValue(summerHillPlatform1, forKey: "hasPlatforms")
        
        summerHillPlatform1.setValue(1, forKey: "number")
        lewisham.setValue("Lewisham", forKey: "name")
        lewisham.setValue(2, forKey: "platforms")
        petersham.setValue("Petersham", forKey: "name")
        petersham.setValue(2, forKey: "platforms")
        stanmore.setValue("Stanmore", forKey: "name")
        stanmore.setValue(2, forKey: "platforms")
        newtown.setValue("Newtown", forKey: "name")
        newtown.setValue(2, forKey: "platforms")
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "StationEntity")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject]
            {
                var name: String = data.value(forKey: "name") as! String
                print(name)
            }
        } catch {
            print("cannot retreieve")
        }
        
        do {
                try context.save()
                print("saved")
        } catch {
                print("failed saving")
        }
    }
    
    func getData() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "StationEntity")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject]
            {
                // print([data])
            }
            } catch {
                print("cannot retreieve")
            }
            
        }
        
    }

