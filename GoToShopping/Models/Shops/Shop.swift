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
    var latitude: Float? = 40.4137053
    var longitude: Float? = -3.6682823
    var image: NSData?
    var logo: NSData?
    var openingHours: String = ""
    var address: String = ""
    var telephone: String = ""
    var email: String = ""
    var url:String = ""
    var speciaOffer:Bool = false
    var googleMapImage: NSData?
    
    init(name: String) {
        self.name = name
    }
}

extension Shop{
    var proxy : String{
        return "\(name) \(image)"
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































