//
//  Dice+CoreDataProperties.swift
//  Rolldices
//
//  Created by Manoel Leal on 29/07/22.
//
//

import Foundation
import CoreData


extension Dice {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dice> {
        return NSFetchRequest<Dice>(entityName: "Dice")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var sides: Int64
    @NSManaged public var result: Int64

}

extension Dice : Identifiable {

}
