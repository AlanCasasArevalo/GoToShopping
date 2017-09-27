//
//  DownloadAllActivitiesInteractorWithURLSessionImplementation.swift
//  GoToShopping
//
//  Created by Alan Casas on 26/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import Foundation


class DownloadAllActivitiesInteractorWithURLSessionImplementation : DownloadAllActivitiesInteractorProtocol {
    
    func execute(onSuccess: @escaping (Activities) -> Void, onError: onErrorClosure) {
        
        let urlStringBackEnd = "https://madrid-shops.com/json_new/getActivities.php"
        let session = URLSession.shared
        
        if let url = URL(string: urlStringBackEnd){
            let task = session.dataTask(with: url) { (data:Data?, response:URLResponse? , error:Error?) in
                
                OperationQueue.main.addOperation {
                    if error != nil{
                        if let onError = onError{
                            onError(error!)
                        }
                    }else{
                        let activities = parseDataToActivity(data: data!)
                        onSuccess(activities)
                    }
                }
            }
            task.resume()
        }
    }
    
    func execute(onSuccess: @escaping (Activities) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
}

