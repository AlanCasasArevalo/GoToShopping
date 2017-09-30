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
    
    if let imageData = shopCoreData.imageCD as Data? {
        shop.image = imageData as NSData
    }
    if let logoData = shopCoreData.logoCD as Data? {
        shop.logo = logoData as NSData
    }

    shop.openingHours = shopCoreData.openingHoursCD ?? ""
    shop.description = shopCoreData.descriptionCD ?? ""
    shop.latitude = shopCoreData.latitudeCD
    shop.longitude = shopCoreData.longitudeCD
    shop.email = shopCoreData.emailCD ?? ""
    shop.telephone = shopCoreData.telephoneCD ?? ""
    shop.speciaOffer = shopCoreData.specialOfferCD
    shop.url = shopCoreData.urlCD ?? ""
//    shop.googleMapImage = (shopCoreData.googleMapImageCD! as NSData)
    
    return shop
}

func mapShopintoShopCoreData(context:NSManagedObjectContext, shop:Shop) -> ShopCoreData {
    let shopCoreData = ShopCoreData(context: context)
    shopCoreData.nameCD = shop.name
    shopCoreData.addressCD = shop.address
    
    if let imageCD = shop.image as Data? {
        shopCoreData.imageCD = imageCD
    }
    if let logoCD = shop.logo as Data? {
        shopCoreData.logoCD = logoCD
    }

    shopCoreData.openingHoursCD = shop.openingHours
    shopCoreData.descriptionCD = shop.description
    shopCoreData.latitudeCD = shop.latitude ?? 0
    shopCoreData.longitudeCD = shop.longitude ?? 0
    shopCoreData.emailCD = shop.email
    shopCoreData.telephoneCD = shop.telephone
    shopCoreData.specialOfferCD = shop.speciaOffer
    shopCoreData.urlCD = shop.url
//    shopCoreData.googleMapImageCD = shop.googleMapImage as Data?

    return shopCoreData
}









































