//
//  SaveAllActivitiesInteractorProtocol.swift
//  GoToShopping
//
//  Created by Alan Casas on 27/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import Foundation
import CoreData


protocol SaveAllActivitiesInteractorProtocol {
    
    func execute ( activities: Activities, context: NSManagedObjectContext, onSuccess: ( Activities ) -> Void, onError: onErrorClosure )
    func execute ( activities: Activities, context: NSManagedObjectContext, onSuccess: ( Activities ) -> Void )
    
}










