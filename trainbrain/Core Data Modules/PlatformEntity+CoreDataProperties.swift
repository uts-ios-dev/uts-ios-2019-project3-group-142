//
//  PlatformEntity+CoreDataProperties.swift
//  trainbrain
//
//  Created by Sidney Cremer on 29/5/19.
//  Copyright © 2019 Sidney Cremer. All rights reserved.
//
//

import Foundation
import CoreData


extension PlatformEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PlatformEntity> {
        return NSFetchRequest<PlatformEntity>(entityName: "PlatformEntity")
    }

    @NSManaged public var number: Int16
    @NSManaged public var exits: NSObject?
    @NSManaged public var hasExits: NSSet?
    @NSManaged public var station: StationEntity?

}

// MARK: Generated accessors for hasExits
extension PlatformEntity {

    @objc(addHasExitsObject:)
    @NSManaged public func addToHasExits(_ value: ExitEntity)

    @objc(removeHasExitsObject:)
    @NSManaged public func removeFromHasExits(_ value: ExitEntity)

    @objc(addHasExits:)
    @NSManaged public func addToHasExits(_ values: NSSet)

    @objc(removeHasExits:)
    @NSManaged public func removeFromHasExits(_ values: NSSet)

}
