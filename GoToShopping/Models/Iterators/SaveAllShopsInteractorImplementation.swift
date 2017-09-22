//
//  SaveAllShopsInteractorImplementation.swift
//  GoToShopping
//
//  Created by Alan Casas on 22/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import Foundation
import CoreData

class SaveAllShopsInteractorImplementation: SaveAllShopsInteractorProtocol{
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping (Shops) -> Void, onError: onErrorClosure) {
        for i in 0 ..< shops.count() {
            let shop = shops.getShop(index: i)
            let _ = mapShopintoShopCoreData(context: context, shop: shop!)
        }
        do {
            try context.save()
            onSuccess(shops)
        } catch  {
            print("Error")
        }
    }
    
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping (Shops) -> Void) {
        execute(shops: shops, context: context, onSuccess: onSuccess, onError: nil)
    }
}
