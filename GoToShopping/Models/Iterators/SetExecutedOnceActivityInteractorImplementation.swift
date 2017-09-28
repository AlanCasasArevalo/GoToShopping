//
//  SetExecutedOnceActivityInteractorImplementation.swift
//  GoToShopping
//
//  Created by Alan Casas on 28/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import Foundation

class SetExecutedOnceActivityInteractorImplementation : SetExecutedOnceActivityInteractorProtocol{
    func execute() {
        let defaults = UserDefaults.standard
        
        defaults.set("SAVED", forKey: "once")
        
        defaults.synchronize()
    }
}
