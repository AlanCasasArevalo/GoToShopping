//
//  DownloadAllIteractorProtocol.swift
//  GoToShopping
//
//  Created by Alan Casas on 29/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import Foundation

protocol DownloadAllIteractorProtocol {
    func execute( onSuccess: @escaping ( Shops, Activities ) -> Void, onError: onErrorClosure )
    func execute( onSuccess: @escaping ( Shops, Activities ) -> Void )
}
