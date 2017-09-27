//
//  SaveAllShopsInteractorProtocol.swift
//  GoToShopping
//
//  Created by Alan Casas on 22/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//
import Foundation
import CoreData

protocol SaveAllShopsInteractorProtocol {
    func execute( shops:Shops, context:NSManagedObjectContext, onSuccess: @escaping ( Shops ) -> Void, onError: onErrorClosure )
    func execute( shops:Shops, context:NSManagedObjectContext, onSuccess: @escaping ( Shops ) -> Void)
}






