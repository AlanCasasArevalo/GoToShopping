//
//  MapActivities.swift
//  GoToShopping
//
//  Created by Alan Casas on 27/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import Foundation

import CoreData

func mapActivityCoreDataIntoActivity(activityCoreData: ActivityCoreData) -> Activity{
    
    let activity = Activity(name: activityCoreData.nameCD ?? "Empty" )
    activity.address = activityCoreData.addressCD ?? ""
    activity.image = (activityCoreData.imageURLCD)?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    activity.logo = (activityCoreData.logoURLCD)?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    activity.openingHours = activityCoreData.openingHoursCD ?? ""
    activity.descriptionAct = activityCoreData.descriptionCD ?? ""
    activity.latitude = activityCoreData.latitudeCD
    activity.longitude = activityCoreData.longitudeCD
    
    return activity
}

func mapActivityintoActivityCoreData(context:NSManagedObjectContext, activity:Activity) -> ActivityCoreData {
    
    let activityCoreData = ActivityCoreData(context: context)
    activityCoreData.nameCD = activity.name
    activityCoreData.addressCD = activity.address
    activityCoreData.imageURLCD = activity.image!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    activityCoreData.logoURLCD = activity.logo!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    activityCoreData.openingHoursCD = activity.openingHours
    activityCoreData.descriptionCD = activity.descriptionAct
    activityCoreData.latitudeCD = activity.latitude ?? 0
    activityCoreData.longitudeCD = activity.longitude ?? 0
    
    activityCoreData.logoCD = downloadAndCacheImage(urlString: activity.logo!) as Data
    
    activityCoreData.imageCD = downloadAndCacheImage(urlString: activity.image!) as Data
    
    let staticMapUrl = "https://www.elpaisdelosjuguetes.es/media/catalog/product/cache/2/image/9df78eab33525d08d6e5fb8d27136e95/h/p/hpe0349_correpasillos_de_madera_para_ni_os_caracol.jpg"

    
    activityCoreData.googleMapImageCD = downloadAndCacheImage(urlString: staticMapUrl) as Data
    
    return activityCoreData
}

  

















