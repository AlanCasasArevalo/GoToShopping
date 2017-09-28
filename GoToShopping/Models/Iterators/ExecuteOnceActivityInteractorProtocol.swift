//
//  ExecuteOnceActivityInteractorProtocol.swift
//  GoToShopping
//
//  Created by Alan Casas on 28/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import Foundation

protocol ExecuteOnceActivityInteractorProtocol {
    func execute(clousure: () -> Void)
}
