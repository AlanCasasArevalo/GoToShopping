//
//  DownloadAllShopsIteractorProtocol.swift
//  GoToShopping
//
//  Created by Alan Casas on 15/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import Foundation

protocol DownloadAllShopsIteractorProtocol {
    func execute( onSuccess: @escaping (Shops) -> Void, onError: onErrorClosure )
    func execute( onSuccess: @escaping (Shops) -> Void )
}





