//
//  SaveAllInteractorImplementation.swift
//  GoToShopping
//
//  Created by Alan Casas on 29/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import Foundation
import CoreData

class SaveAllInteractorImplementation: SaveAllInteractorProtocol{
    func execute(shops: Shops, activities: Activities, context: NSManagedObjectContext, onSuccess: @escaping (Shops, Activities) -> Void, onError: onErrorClosure) {
        
        for i in 0 ..< shops.count(){
            let shop = shops.getShop(index: i)
            _ = mapShopintoShopCoreData(context: context, shop: shop!)
        }
        for i in 0 ..< activities.count(){
            let activity = activities.getActivity(index: i)
            _ = mapActivityintoActivityCoreData(context: context, activity: activity!)
        }
 
        do {
            try context.save()
            onSuccess(shops, activities)
            
            saveFinished = true
            let saveFinishedNotification = Notification(name: Notification.Name(rawValue: "saveFinished"), object: self, userInfo: ["saveFinished" : saveFinished])
            NotificationCenter.default.post(saveFinishedNotification)

        } catch  {
            print("Error")
        }
        
        
    }
    
    func execute(shops: Shops, activities: Activities, context: NSManagedObjectContext, onSuccess: @escaping (Shops, Activities) -> Void) {
        execute(shops: shops, activities: activities, context: context, onSuccess: onSuccess, onError: nil)
    }
    
}
