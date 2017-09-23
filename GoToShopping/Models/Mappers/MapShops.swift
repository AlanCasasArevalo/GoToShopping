//
//  MapShops.swift
//  GoToShopping
//
//  Created by Alan Casas on 22/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import UIKit
import CoreData
import SDWebImage


func mapShopCoreDataIntoShop(shopCoreData: ShopCoreData) -> Shop{
    let shop = Shop(name: shopCoreData.nameCD ?? "Empty" )
    shop.address = shopCoreData.addressCD ?? ""
    shop.image = shopCoreData.imageCD ?? ""
    shop.logo = shopCoreData.logoCD ?? ""
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

func mapShopintoShopCoreData(context:NSManagedObjectContext, shop:Shop) -> ShopCoreData {
    let shopCoreData = ShopCoreData(context: context)
    shopCoreData.nameCD = shop.name
    shopCoreData.addressCD = shop.address
    shopCoreData.imageCD = shop.image
    
    
    
    
    
    shopCoreData.logoCD = shop.logo
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









































