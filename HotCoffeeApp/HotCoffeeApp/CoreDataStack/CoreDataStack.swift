//
//  CoreDataStack.swift
//  HotCoffeeApp
//
//  Created by Subhra Roy on 04/01/22.
//

import Foundation
import CoreData

private let  sharedGroupContainerName = "com.ARCDemo.HotCoffeeApp"
private let modelExtension = "momd"

final class CoreDataStack{
    
    static let shared = CoreDataStack(dbName:"HotCoffeeApp")
    
    private var dbName: String!
    
    private convenience init(dbName: String){
        self.init()
        self.dbName = dbName
    }
    
    private init(){
        
    }
    
    var mainContext: NSManagedObjectContext {
        let context = persistentContainer.viewContext
        context.automaticallyMergesChangesFromParent = true
        return context
    }
    
    var privateContext: NSManagedObjectContext {
        let childContext = persistentContainer.newBackgroundContext()
        childContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy

        return childContext
    }
    
    // MARK: - Core Data stack
    lazy private var persistentContainer: NSPersistentContainer = {
        let bundle = Bundle(identifier: sharedGroupContainerName)
        let modelURL = bundle!.url(forResource: self.dbName, withExtension: modelExtension)!
        let managedObjectModel =  NSManagedObjectModel(contentsOf: modelURL)
        
        let container = NSPersistentContainer(name: self.dbName, managedObjectModel: managedObjectModel!)
        container.loadPersistentStores { (storeDescription, error) in
            
            if let err = error{
                fatalError("Loading of store failed:\(err)")
            }
        }
        
        return container
    }()
        
    // MARK: - Core Data Saving support
    
    func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> Void) {
        self.persistentContainer.performBackgroundTask(block)
    }
    
    func save(on context: NSManagedObjectContext){
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    func saveContext () {
        let context = mainContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
    deinit {
      
    }
    
}

