//
//  StationEntity+CoreDataProperties.swift
//  trainbrain
//
//  Created by Sidney Cremer on 29/5/19.
//  Copyright © 2019 Sidney Cremer. All rights reserved.
//
//

import Foundation
import CoreData


extension StationEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<StationEntity> {
        return NSFetchRequest<StationEntity>(entityName: "StationEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var platforms: NSObject?
    @NSManaged public var hasPlatforms: NSSet?

}

// MARK: Generated accessors for hasPlatforms
extension StationEntity {

    @objc(addHasPlatformsObject:)
    @NSManaged public func addToHasPlatforms(_ value: PlatformEntity)

    @objc(removeHasPlatformsObject:)
    @NSManaged public func removeFromHasPlatforms(_ value: PlatformEntity)

    @objc(addHasPlatforms:)
    @NSManaged public func addToHasPlatforms(_ values: NSSet)

    @objc(removeHasPlatforms:)
    @NSManaged public func removeFromHasPlatforms(_ values: NSSet)

}
