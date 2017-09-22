//
//  DownloadAllShopsInteractorURLSessionImplementation.swift
//  GoToShopping
//
//  Created by Alan Casas on 17/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import Foundation

class DownloadAllShopsInteractorURLSessionImplementation: DownloadAllShopsIteractorProtocol {
    func execute(onSuccess: @escaping (Shops) -> Void, onError: onErrorClosure) {
        let urlStringBackEnd = "https://madrid-shops.com/json_new/getShops.php"
        let session = URLSession.shared
        
        OperationQueue.main.addOperation {
            if let url = URL(string: urlStringBackEnd){
                let task = session.dataTask(with: url) { (data:Data?, response:URLResponse?, error: Error?) in
                    if error != nil{
                        //Tratar error
                    }
                    
                    let shopsList = parseDataToShop(data: data!)
                    onSuccess(shopsList)
                }
                task.resume()
            }
        }
    }
    
    func execute(onSuccess: @escaping (Shops) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
}


















