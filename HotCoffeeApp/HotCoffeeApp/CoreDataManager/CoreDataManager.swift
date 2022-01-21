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
              choice type: String,
              completion: @escaping(_ status: Bool) -> ()){
        
        let privateContext = self.coreDataStack.privateContext
        privateContext.perform {
            let order = Order(context: privateContext)
            order.customerName = name
            order.coffeeType = type
            
            do{
                try privateContext.save()
                completion(true)
            }catch let error{
                print("\(error.localizedDescription)")
                completion(false)
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
    
    func deleteOrder(name: String,
                     completion: @escaping(_ status: Bool) -> ()){
        let privateContext = self.coreDataStack.privateContext
        privateContext.perform {
            do{
                if let order = self.fetchOrder(name: name, for: privateContext){
                    privateContext.delete(order)
                    try privateContext.save()
                    completion(true)
                }else{
                    completion(false)
                }
            }catch let error as NSError{
                print("\(error.localizedDescription)")
                completion(false)
            }
        }
    }
    
    private func fetchOrder(name: String, for context: NSManagedObjectContext) -> Order?{
        var orders:[Order]?
        let requst: NSFetchRequest<Order> = Order.fetchRequest()
        requst.predicate = NSPredicate(format: "customerName == %@", name)
        do{
            orders = try context.fetch(requst)
        }catch{
            
        }
        return orders?.first
    }
    
}
