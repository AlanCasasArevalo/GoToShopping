//
//  DownloadAllShopsInteractorNSOpImplementation.swift
//  GoToShopping
//
//  Created by Alan Casas on 16/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import Foundation

final class DownloadAllShopsInteractorNSOpImplementation : DownloadAllShopsIteractorProtocol{
    func execute(onSuccess: @escaping (Shops) -> Void, onError: onErrorClosure) {
        let urlStringBackEnd = "https://madrid-shops.com/json_new/getShops.php"
        let queue = OperationQueue()

        queue.addOperation {
            if let urlBackEnd = URL(string: urlStringBackEnd), let data = (NSData(contentsOf: urlBackEnd) as Data?){
                let shopsList = parseDataToShop(data: data )
                
                OperationQueue.main.addOperation {
                    onSuccess(shopsList)
                }
            }
        }
    }
    
    func execute(onSuccess: @escaping (Shops) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
}
