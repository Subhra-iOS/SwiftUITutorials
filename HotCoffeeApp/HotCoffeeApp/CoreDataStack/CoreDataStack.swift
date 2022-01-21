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
    //private let dispatchQueue = Dis
    
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
        childContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump

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
    
    /*lazy private var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        //let container = NSPersistentContainer(name: String(format: "%@.sqlite", arguments: [self.dbName]))
        let container = NSPersistentContainer(name: self.dbName)
                
        let directoryURL  = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: sharedGroupContainerName)!
        let url = directoryURL.appendingPathComponent("Documents/")
        
        print("\(url)")
        
        container.persistentStoreCoordinator.setURL(url, for: NSPersistentStore.storePersistance(StoreModel(modelName:self.dbName, storeUrl: url)))
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
            }else{
                
            }
        })
        return container
    }()*/
    
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

/*struct StoreModel {
    let modelName: String
    let storeUrl: URL
}

extension NSPersistentStore{
    
    static var storePersistance:(StoreModel) -> NSPersistentStore = { storeModel  in
        let manageObjectModel = Bundle.main.managedObjectModel(name: storeModel.modelName)
        return NSPersistentStore(persistentStoreCoordinator: NSPersistentStoreCoordinator(managedObjectModel: manageObjectModel), configurationName: nil, at: storeModel.storeUrl, options: stockSQLiteStoreOptions)
    }
    
    static private var stockSQLiteStoreOptions: [AnyHashable: Any] {
        return [
            NSMigratePersistentStoresAutomaticallyOption: true,
            NSInferMappingModelAutomaticallyOption: true,
            NSSQLitePragmasOption: ["journal_mode": "DELETE"],
            NSPersistentStoreFileProtectionKey: FileProtectionType.complete
        ]
    }
    
}


extension Bundle {
    static private let modelExtension = "momd"
    static private let modelAlternateExtension = "mom"
    /**
     Attempts to return an instance of NSManagedObjectModel for a given name within the bundle.
     
     - parameter name: The file name of the model without the extension.
     - returns: The NSManagedObjectModel from the bundle with the given name.
     **/
    public func managedObjectModel(name: String) -> NSManagedObjectModel {
                
        var momPath : String? = Bundle.main.path(forResource: name, ofType: Bundle.modelExtension) ?? ""
        
        if let _ =  momPath {
            
        }else{
            momPath = Bundle.main.path(forResource: name, ofType: Bundle.modelAlternateExtension)!
        }
        
        let url : URL = URL(fileURLWithPath: momPath ?? "")
        guard let model = NSManagedObjectModel(contentsOf: url) else {
            preconditionFailure("Model not found or corrupted with name: \(name) in bundle: \(self)")
        }
        return model
    }
}*/

/**
 
 //MARK: Accessor
 public func upsertDownSync(list: [QModel], completeHander: @escaping (Bool)->()) {
 
 let context = self.backgroundContext
 context.perform {
 
 for model in list {
 self.upsertDownSync(data: model, context: context)
 }
 
 do {
 try context.save()
 completeHander(true)
 } catch let error {
 print("Failed to upsert: \(error.localizedDescription)")
 completeHander(false)
 }
 }
 }
 
 */
