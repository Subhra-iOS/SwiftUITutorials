//
//  CoreDataManager.swift
//  HotCoffeeApp
//
//  Created by Subhra Roy on 05/01/22.
//

import Foundation
import CoreData

class CoreDataManager{
    
    private var coreDataStack: CoreDataStack!
    
    convenience init(stack: CoreDataStack){
        self.init()
        self.coreDataStack = stack
    }
    
    private init(){ }
    
    func save(user name: String,
              choice type: String){
        
        let privateContext = self.coreDataStack.mainContext
        privateContext.perform {
            let order = Order(context: privateContext)
            order.customerName = name
            order.coffeeType = type
            
            do{
                try privateContext.save()
            }catch let error{
                print("\(error.localizedDescription)")
            }
        }
    }
    
    func fetchAllOrders() -> [Order]?{
        
        var orders: [Order]?
        let privateContext = self.coreDataStack.mainContext
        let orderRequest: NSFetchRequest<Order> = Order.fetchRequest()
        do{
            orders = try privateContext.fetch(orderRequest)
        }catch{
            
        }
        return orders
    }
    
}
