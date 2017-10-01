//
//  String+Data.swift
//  GoToShopping
//
//  Created by Alan Casas on 1/10/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import Foundation


func downloadAndCacheImage(urlString: String) -> NSData? {    
    
    if let urlFromString = URL(string: urlString),
        let dataToString = NSData(contentsOf: urlFromString){
        return dataToString as NSData
        
    }else{
        let imageTest = #imageLiteral(resourceName: "defaultPhoto")
        let dataTest = UIImagePNGRepresentation(imageTest)!
        print("Una 💩💩💩💩💩💩💩 pa mi ")
        return dataTest as NSData
    }
}





















































