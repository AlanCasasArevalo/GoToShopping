//
//  ExecuteOnceInteractorImplementation.swift
//  GoToShopping
//
//  Created by Alan Casas on 22/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import Foundation

class ExecuteOnceInteractorImplementation : ExecuteOnceInteractorProtocol{
    func execute( clousure: () -> Void ) {
        let defaults = UserDefaults.standard
        
        if let _ = defaults.string(forKey: "once") {
        }else{
            clousure()
        }
    }
}






