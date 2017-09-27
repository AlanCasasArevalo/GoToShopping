//
//  DownloadAllShopsIteractorImplementationFake.swift
//  GoToShopping
//
//  Created by Alan Casas on 15/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import Foundation

final class DownloadAllShopsIteractorImplementationFake : DownloadAllShopsIteractorProtocol {
    func execute(onSuccess: @escaping (Shops) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }

    func execute(onSuccess: @escaping (Shops) -> Void, onError: onErrorClosure) {
        let shopsListFake = Shops()
        
        for i in 0 ..< 20 {
            let shopFake = Shop(name: "La tienda fake es: \( i )")
            
            shopsListFake.addShop(shop: shopFake)
        }
        OperationQueue.main.addOperation {
            onSuccess(shopsListFake)
        }
    }
}


















