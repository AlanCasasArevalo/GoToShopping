//
//  DownloadAllInteractorNSOpImplementation.swift
//  GoToShopping
//
//  Created by Alan Casas on 29/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import Foundation


final class DownloadAllInteractorNSOpImplementation : DownloadAllIteractorProtocol{
    func execute(onSuccess: @escaping (Shops, Activities) -> Void, onError: onErrorClosure) {
        let urlShopsBackEndString = "https://madrid-shops.com/json_new/getShops.php"
        let urlActivitiesBackEndString = "https://madrid-shops.com/json_new/getActivities.php"
        
        let queue = OperationQueue()
        
        queue.addOperation {
            if let urlShops = URL(string: urlShopsBackEndString),
                let urlActivies = URL(string: urlActivitiesBackEndString),
                let dataShops = NSData(contentsOf: urlShops),
                let dataActivies = NSData(contentsOf: urlActivies){
                let shopList = parseDataToShop(data: dataShops as Data)
                let activiesList = parseDataToActivity(data: dataActivies as Data)
                
                OperationQueue.main.addOperation {
                    onSuccess(shopList, activiesList)
                }
            }
        }
    }
    
    func execute(onSuccess: @escaping (Shops, Activities) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
}

