//
//  Order+CoreDataProperties.swift
//  HotCoffeeApp
//
//  Created by Subhra Roy on 13/01/22.
//
//

import Foundation
import CoreData


extension Order {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Order> {
        return NSFetchRequest<Order>(entityName: "Order")
    }

    @NSManaged public var coffeeType: String?
    @NSManaged public var customerName: String?

}

extension Order : Identifiable {

}
