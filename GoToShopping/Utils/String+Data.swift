//
//  String+Data.swift
//  GoToShopping
//
//  Created by Alan Casas on 1/10/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import Foundation


func downloadAndCacheImage(urlString: String) -> NSData {
    let imageTest = #imageLiteral(resourceName: "defaultPhoto")
    let dataTest = UIImagePNGRepresentation(imageTest)!
    if let urlCD = URL(string: urlString),
        let dataToCD = NSData(contentsOf: urlCD){
        return dataToCD
    }else{
        print("Una 💩💩💩💩💩💩💩 pa mi ")
        return dataTest as NSData
    }
}



















































