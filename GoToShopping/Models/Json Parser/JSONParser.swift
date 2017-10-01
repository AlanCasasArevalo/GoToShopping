//
//  JSONParser.swift
//  GoToShopping
//
//  Created by Alan Casas on 17/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import UIKit
import SDWebImage


func parseDataToShop(data: Data) -> Shops {
    
    let local = (Locale.current.languageCode as! String)
    var staticMapUrl:String!
    
    let shopsList = Shops()
    do {
        
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String,Any>
        let result = jsonObject["result"] as! [Dictionary<String,Any>]
        for shopJSON in result {
            let shop = Shop(name: shopJSON["name"]! as! String)
            shop.address = shopJSON["address"]! as! String
            shop.image = (shopJSON["img"]! as! String)
            shop.logo = (shopJSON["logo_img"]! as! String)
            
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
            
            
            if let latitudeJson = shopJSON["gps_lat"] as? NSString {
                shop.latitude = latitudeJson.floatValue
            }
            if let longitudeJson = shopJSON["gps_lon"] as? NSString {
                shop.longitude = longitudeJson.floatValue
            }
            
            staticMapUrl =  "https://maps.googleapis.com/maps/api/staticmap?center=\(shop.latitude ?? 40.4137053),\(shop.longitude ?? 40.4137053)&zoom=17&size=320x220&scale=2&markers=%7Ccolor:0x9C7B14%7C\(shop.latitude ?? -3.6682823),\(shop.longitude ?? -3.6682823)"
            
//            staticMapUrl = "http://www.elpaisdelosjuguetes.es/media/catalog/product/cache/2/image/9df78eab33525d08d6e5fb8d27136e95/h/p/hpe0349_correpasillos_de_madera_para_ni_os_caracol.jpg"
            
            shop.googleMapImage = staticMapUrl

            shopsList.addShop(shop: shop)
        }
    }catch  {
    }
    return shopsList
}

func parseDataToActivity(data: Data) -> Activities {
    
    let local = (Locale.current.languageCode) as! String
    
    let activitiesList = Activities()
    do {
        
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String,Any>
        let result = jsonObject["result"] as! [Dictionary<String,Any>]
        for activityJSON in result {
            let activity = Activity(name: activityJSON["name"]! as! String)
            activity.address = activityJSON["address"]! as! String
            activity.image = (activityJSON["img"]! as! String)
            activity.logo = (activityJSON["logo_img"]! as! String)
            
            switch local.lowercased() {
            case "es":
                activity.descriptionAct = activityJSON ["description_es"] as? String
                activity.openingHours = (activityJSON["opening_hours_es"] as? String)!
                
            case "en":
                activity.descriptionAct = activityJSON ["description_en"] as? String
                activity.openingHours = (activityJSON["opening_hours_en"] as? String)!
                
            case "ja" :
                activity.descriptionAct = activityJSON ["description_jp"] as? String
                activity.openingHours = (activityJSON["opening_hours_jp"] as? String)!
                
            case "zh":
                activity.descriptionAct = activityJSON ["description_cn"] as? String
                activity.openingHours = (activityJSON["opening_hours_cn"] as? String)!
                
            default:
                activity.descriptionAct = activityJSON ["description_en"] as? String
                activity.openingHours = (activityJSON["opening_hours_en"] as? String)!
            }
            
            if var latitudeParser = activityJSON["gps_lat"] as? String,
                let longitude = activityJSON["gps_lon"] as? String{
                activity.latitude = 40.000
                
                var latitude = ""
                for myCharacter in latitudeParser.characters{
                    if myCharacter != " "{
                        latitude.append(myCharacter)
                    }
                }
                activity.latitude = Float(latitude)
                
                activity.longitude = Float(longitude)
            }
            
            let staticMapUrl = "https://maps.googleapis.com/maps/api/staticmap?center=\(activity.latitude ?? 40.4252643),\(activity.longitude ?? -3.6920596)&zoom=17&size=320x220&scale=2&markers=%7Ccolor:0x9C7B14%7C\(activity.latitude ?? 40.4252643),\(activity.longitude ?? -3.6920596)"
            activity.googleMapImage = staticMapUrl

            
            activitiesList.addActivity(activity: activity)
        }
    }catch  {
    }
    return activitiesList
}




















