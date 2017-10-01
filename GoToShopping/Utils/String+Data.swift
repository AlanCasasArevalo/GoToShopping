//
//  String+Data.swift
//  GoToShopping
//
//  Created by Alan Casas on 1/10/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import Foundation


func downloadAndCacheImage(urlString: String) -> Data {
    let imageTest = #imageLiteral(resourceName: "defaultPhoto")
    let dataTest = UIImagePNGRepresentation(imageTest)!
    
    var dataToCoreData = Data()
    print( "Imprimo la urlString que viene por parametro \(urlString)" )

    if let url = URL(string: urlString) {
        
        print( "Imprimo la urlString que viene por parametro \(urlString) modificada" )

        print( "Imprimo la url que convertimos  \(url)" )

        
        do {
            dataToCoreData = try Data(contentsOf: url)
            return dataToCoreData
        } catch{
            
            print("Una 💩💩💩💩💩💩💩 pa mi ")
            return dataTest
        }
    }
    
    return dataToCoreData

//
//    if let urlCD = URL(string: urlString),
//        let dataToCD = NSData(contentsOf: urlCD){
//        return dataToCD
//    }else{
//        print("Una 💩💩💩💩💩💩💩 pa mi ")
//        return dataTest as NSData
//    }
}



















































