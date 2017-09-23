//
//  Shop.swift
//  GoToShopping
//
//  Created by Alan Casas on 15/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import UIKit

final class Shop {
    var name: String
    var description: String = ""
    var latitude: Float? = nil
    var longitude: Float? = nil
    var image: String? = ""
    var logo: String? = ""
    var openingHours: String = ""
    var address: String = ""
    var telephone: String = ""
    var email: String = ""
    var url:String = ""
    var speciaOffer:Bool = false
    
    
    init(name: String) {
        self.name = name
    }
}

extension Shop{
    var proxy : String{
        if let image = image {
            return "\(name) \(image)"
        }
        return "\(name)"
    }
}

extension Shop: Hashable{
    var hashValue: Int {
        return proxy.hashValue
    }
}

extension Shop: Equatable{
    static func ==(lhs: Shop, rhs: Shop) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

extension Shop:Comparable{
    static func <(lhs: Shop, rhs: Shop) -> Bool {
        return lhs.proxy < rhs.proxy
    }
}































