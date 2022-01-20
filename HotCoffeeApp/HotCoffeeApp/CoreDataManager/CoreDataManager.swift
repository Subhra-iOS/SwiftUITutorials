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
        let mainContext = self.coreDataStack.mainContext
        let orderRequest: NSFetchRequest<Order> = Order.fetchRequest()
        do{
            orders = try mainContext.fetch(orderRequest)
        }catch let error as NSError{
            print("\(error.localizedDescription)")
        }
        return orders
    }
    
    func deleteOrder(name: String){
        let mainContext = self.coreDataStack.mainContext
        do{
            if let order = self.fetchOrder(name: name){
                mainContext.delete(order)
                try mainContext.save()
            }
        }catch let error as NSError{
            print("\(error.localizedDescription)")
        }
    }
    
    private func fetchOrder(name: String) -> Order?{
        var orders:[Order]?
        let requst: NSFetchRequest<Order> = Order.fetchRequest()
        requst.predicate = NSPredicate(format: "customerName == %@", name)
        let mainContext = self.coreDataStack.mainContext
        do{
            orders = try mainContext.fetch(requst)
        }catch{
            
        }
        return orders?.first
    }
    
}
