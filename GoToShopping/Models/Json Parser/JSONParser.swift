//
//  JSONParser.swift
//  GoToShopping
//
//  Created by Alan Casas on 17/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import UIKit

func parseDataToShop(data: Data) -> Shops {
    
    let local = Locale.current.languageCode as! String
    print(local)
    
    let shopsList = Shops()
    do {
        
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String,Any>
        let result = jsonObject["result"] as! [Dictionary<String,Any>]
        for shopJSON in result {
            let shop = Shop(name: shopJSON["name"]! as! String)
            shop.address = shopJSON["address"]! as! String
            shop.image = shopJSON["img"] as! String
            shop.logo = shopJSON["logo_img"] as! String

        switch local.lowercased() {
        case "es":
            shop.description = shopJSON ["description_es"] as! String
            shop.openingHours = shopJSON["opening_hours_es"] as! String

        case "en":
            shop.description = shopJSON ["description_en"] as! String
            shop.openingHours = shopJSON["opening_hours_en"] as! String

        case "ja" :
            shop.description = shopJSON ["description_jp"] as! String
            shop.openingHours = shopJSON["opening_hours_jp"] as! String

        case "zh":
            shop.description = shopJSON ["description_cn"] as! String
            shop.openingHours = shopJSON["opening_hours_cn"] as! String
            
        default:
            shop.description = shopJSON ["description_en"] as! String
            shop.openingHours = shopJSON["opening_hours_en"] as! String
        }
            
            if var latitudeParser = shopJSON["gps_lat"] as? String,
                let longitude = shopJSON["gps_lon"] as? String{
                shop.latitude = 40.000

                    var latitude = ""
                    for myCharacter in latitudeParser.characters{
                        if myCharacter != " "{
                            latitude.append(myCharacter)
                        }
                    }
                    shop.latitude = Float(latitude)
                
                shop.longitude = Float(longitude)
            }
            
            shop.telephone = shopJSON["telephone"] as! String
            shop.email = shopJSON["email"] as! String
            shop.url = shopJSON["url"] as! String
            
//            print(shop)
//            if (shop.longitude != nil && shop.longitude != nil ) {
//                print(shop.latitude!)
//                print(shop.longitude!)
//            }
            
            
            shopsList.addShop(shop: shop)
        }
    }catch  {
    }
    return shopsList
}




















