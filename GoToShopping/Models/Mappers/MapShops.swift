//
//  MapShops.swift
//  GoToShopping
//
//  Created by Alan Casas on 22/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import UIKit
import CoreData


func mapShopCoreDataIntoShop(shopCoreData: ShopCoreData) -> Shop{
    
    let shop = Shop(name: shopCoreData.nameCD ?? "Empty" )
    shop.address = shopCoreData.addressCD ?? ""
    
    if let imgData = UIImage(data: shopCoreData.imageCD!){
        shop.image = "https://madrid-shops.com/media/shops/logo-cortefiel-200.jpg"
//        shop.image = shopCoreData.imageCD
    }
    
    if let imgData = UIImage(data: shopCoreData.logoCD!){
        shop.logo = "https://madrid-shops.com/media/shops/logo-cortefiel-200.jpg"
//        shop.logo = shopCoreData.logoCD ?? ""
        
    }
    
    shop.openingHours = shopCoreData.openingHoursCD ?? ""
    shop.description = shopCoreData.descriptionCD ?? ""
    shop.latitude = shopCoreData.latitudeCD
    shop.longitude = shopCoreData.longitudeCD
    shop.email = shopCoreData.emailCD ?? ""
    shop.telephone = shopCoreData.telephoneCD ?? ""
    shop.speciaOffer = shopCoreData.specialOfferCD
    shop.url = shopCoreData.urlCD ?? ""
    
    return shop
}




func stringToData(imgString: String?, coreDataKey: String) -> Data?{
    let imageDataCached: Data?
    let imgCached = NSCache<AnyObject, NSData>()
    if let imgLogoString = imgString,
        let imgLogoUrl = URL(string: imgLogoString),
        let imgData = NSData(contentsOf: imgLogoUrl){
        imgCached.setObject(imgData, forKey: coreDataKey as AnyObject)
        imageDataCached = imgCached.object(forKey: coreDataKey as AnyObject)! as Data

        return imageDataCached
    }else{
        return nil
    }
}

func mapShopintoShopCoreData(context:NSManagedObjectContext, shop:Shop) -> ShopCoreData {
    let shopCoreData = ShopCoreData(context: context)
    shopCoreData.nameCD = shop.name
    shopCoreData.addressCD = shop.address
    
    shopCoreData.imageCD = stringToData(imgString: shop.image, coreDataKey: "shopImage")
    shopCoreData.logoCD = stringToData(imgString: shop.logo, coreDataKey: "shopLogo")

    shopCoreData.openingHoursCD = shop.openingHours
    shopCoreData.descriptionCD = shop.description
    shopCoreData.latitudeCD = shop.latitude ?? 0
    shopCoreData.longitudeCD = shop.longitude ?? 0
    shopCoreData.emailCD = shop.email
    shopCoreData.telephoneCD = shop.telephone
    shopCoreData.specialOfferCD = shop.speciaOffer
    shopCoreData.urlCD = shop.url

    return shopCoreData
}











