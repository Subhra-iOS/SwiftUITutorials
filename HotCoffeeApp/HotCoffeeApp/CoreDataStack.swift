//
//  CoreDataStack.swift
//  HotCoffeeApp
//
//  Created by Subhra Roy on 04/01/22.
//

import Foundation
import CoreData

class CoreDataStack{
    
    private var dbName: String!
    
    convenience init(dbName: String){
        self.init()
        self.dbName = dbName
    }
    
    private init(){
        
    }
    
    var mainContext: NSManagedObjectContext {
        let context = persistentContainer.viewContext
        return context
    }
    
    
    @available(iOS 14.0, *)
    var privateContext: NSManagedObjectContext {
        let childContext = persistentContainer.newBackgroundContext()
        childContext.parent = mainContext
        childContext.mergePolicy = NSMergePolicy.mergeByPropertyStoreTrump
        childContext.automaticallyMergesChangesFromParent = true
        let didSaveNotification = NSManagedObjectContext.didSaveObjectsNotification
        NotificationCenter.default.addObserver(self, selector: #selector(didSave(_:)),
                                               name: didSaveNotification, object: childContext)
        return childContext
    }
    
    @objc private func didSave(_ notification: Notification) {
        mainContext.mergeChanges(fromContextDidSave: notification)
        self.saveContext()
    }
    
   
    // MARK: - Core Data stack
    
    lazy private var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: self.dbName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> Void) {
        self.persistentContainer.performBackgroundTask(block)
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
    
    @available(iOS 14.0, *)
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSManagedObjectContext.didSaveObjectsNotification, object: nil)
    }
    
}
