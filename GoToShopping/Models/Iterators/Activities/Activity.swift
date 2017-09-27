//
//  Activity.swift
//  GoToShopping
//
//  Created by Alan Casas on 26/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import UIKit

final class Activity{
    
    var name: String
    var descriptionAct: String?
    var latitude: Float? = 40.4137053
    var longitude: Float? = -3.6682823
    var image: String = ""
    var logo: String = ""
    var openingHours: String = ""
    var address: String = ""
    var telephone: String = ""
    var email: String = ""
    var url:String = ""
    var speciaOffer:Bool = false

    init(name:String) {
        self.name = name
    }

}

extension Activity{
    var proxy : String{
        return "\(name) \(image)"
    }
}

extension Activity: Hashable{
    var hashValue: Int {
        return proxy.hashValue
    }
}

extension Activity: Equatable{
    static func ==(lhs: Activity, rhs: Activity) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

extension Activity:Comparable{
    static func <(lhs: Activity, rhs: Activity) -> Bool {
        return lhs.proxy < rhs.proxy
    }
}











