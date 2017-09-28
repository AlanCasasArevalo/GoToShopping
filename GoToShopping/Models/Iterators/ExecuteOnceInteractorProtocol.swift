//
//  ExecuteOnceInteractorProtocol.swift
//  GoToShopping
//
//  Created by Alan Casas on 22/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import Foundation

protocol ExecuteOnceInteractorProtocol {
    func execute(clousure: () -> Void) 
}
