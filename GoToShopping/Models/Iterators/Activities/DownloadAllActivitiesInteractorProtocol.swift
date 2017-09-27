//
//  DownloadAllActivitiesInteractorProtocol.swift
//  GoToShopping
//
//  Created by Alan Casas on 26/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import Foundation

protocol DownloadAllActivitiesInteractorProtocol {
    func execute( onSuccess: @escaping (Activities) -> Void, onError: onErrorClosure )
    func execute( onSuccess: @escaping (Activities) -> Void )
}

