//
//  SaveAllInteractorProtocol.swift
//  GoToShopping
//
//  Created by Alan Casas on 29/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import Foundation
import CoreData

protocol SaveAllInteractorProtocol {
    func execute( shops:Shops, activities: Activities, context:NSManagedObjectContext, onSuccess: @escaping ( Shops, Activities ) -> Void, onError: onErrorClosure )
    func execute( shops:Shops, activities: Activities, context:NSManagedObjectContext, onSuccess: @escaping ( Shops, Activities ) -> Void)
}
