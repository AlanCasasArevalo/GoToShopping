//
//  Shops.swift
//  GoToShopping
//
//  Created by Alan Casas on 15/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import Foundation

protocol ShopsProtocol {
    func count() -> Int
    func addShop(shop: Shop)
    func getShop(index:Int) -> Shop?
}

final class Shops : ShopsProtocol {
    private var shopsList : [Shop]?
    
    public init() {
        self.shopsList = []
    }
    
}

extension Shops{
    func count() -> Int {
        return (shopsList?.count)!
    }
}

extension Shops{
    func addShop(shop: Shop) {
        shopsList?.append(shop)
    }
}

extension Shops{
    func getShop(index: Int) -> Shop? {
        if index > (shopsList?.count)! || index < 0 {
            return nil
        }
        return shopsList?[index]
    }
}





















