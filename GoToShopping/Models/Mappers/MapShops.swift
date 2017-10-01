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
    shop.image = (shopCoreData.imageURLCD)?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    shop.logo = (shopCoreData.logoURLCD)?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    shop.openingHours = shopCoreData.openingHoursCD ?? ""
    shop.description = shopCoreData.descriptionCD ?? ""
    shop.latitude = shopCoreData.latitudeCD
    shop.longitude = shopCoreData.longitudeCD
    
    return shop
}

func mapShopintoShopCoreData(context:NSManagedObjectContext, shop:Shop) -> ShopCoreData {
    let shopCoreData = ShopCoreData(context: context)
    shopCoreData.nameCD = shop.name
    shopCoreData.addressCD = shop.address
    shopCoreData.imageURLCD = shop.image!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    shopCoreData.logoURLCD = shop.logo!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    shopCoreData.openingHoursCD = shop.openingHours
    shopCoreData.descriptionCD = shop.description
    shopCoreData.latitudeCD = shop.latitude ?? 0
    shopCoreData.longitudeCD = shop.longitude ?? 0
    
    shopCoreData.logoCD = downloadAndCacheImage(urlString: shop.logo!) as Data

    shopCoreData.imageCD = downloadAndCacheImage(urlString: shop.image!) as Data
    
    let staticMapUrl = "https://www.elpaisdelosjuguetes.es/media/catalog/product/cache/2/image/9df78eab33525d08d6e5fb8d27136e95/h/p/hpe0349_correpasillos_de_madera_para_ni_os_caracol.jpg"
    
    shopCoreData.googleMapImageCD = downloadAndCacheImage(urlString: staticMapUrl) as Data
    
    
    return shopCoreData
}









































