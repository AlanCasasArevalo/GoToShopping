//
//  SetExecutedOnceInteractorImplementation.swift
//  GoToShopping
//
//  Created by Alan Casas on 22/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import Foundation

class SetExecutedOnceInteractorImplementation : SetExecutedOnceInteractorProtocol{
    func execute(value:String, key:String) {
        let defaults = UserDefaults.standard
        
        defaults.set(value, forKey: key)
        
        defaults.synchronize()
    }
}
