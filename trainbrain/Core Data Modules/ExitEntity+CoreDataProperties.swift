//
//  ExitEntity+CoreDataProperties.swift
//  trainbrain
//
//  Created by Sidney Cremer on 29/5/19.
//  Copyright © 2019 Sidney Cremer. All rights reserved.
//
//

import Foundation
import CoreData


extension ExitEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExitEntity> {
        return NSFetchRequest<ExitEntity>(entityName: "ExitEntity")
    }

    @NSManaged public var type: NSObject?
    @NSManaged public var carriageNumber: Int16
    @NSManaged public var doorNumber: Int16
    @NSManaged public var platform: PlatformEntity?

}
