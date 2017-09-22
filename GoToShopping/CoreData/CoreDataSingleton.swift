//
//  CoreDataSingleton.swift
//  GoToShopping
//
//  Created by Alan Casas on 21/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataStack {
    static let sharedInstance: CoreDataStackSingleton = {
        let instance = CoreDataStackSingleton()
        return instance
    }()
}

final class CoreDataStackSingleton {
    
    var createContainerError:NSError?
    var saveContextError: NSError?
        
    func createContainer(dataBaseName: String) -> NSPersistentContainer  {
        let container = NSPersistentContainer(name: dataBaseName)
        container.loadPersistentStores(completionHandler: { (storeDescription, containerError) in
            if let error = containerError as NSError? {
                self.createContainerError = error
            }
        })
        return container
    }
    
    func saveContext (context: NSManagedObjectContext) {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                saveContextError = error as NSError
            }
        }
    }
}


