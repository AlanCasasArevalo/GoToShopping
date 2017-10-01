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
    activityCoreData.googleMapImageCDURL = activity.googleMapImage

    
    activityCoreData.logoCD = downloadAndCacheImage(urlString: activity.logo!) as Data
    
    activityCoreData.imageCD = downloadAndCacheImage(urlString: activity.image!) as Data

    activityCoreData.googleMapImageCD = downloadAndCacheImage(urlString: activityCoreData.googleMapImageCDURL!) as Data
    
    return activityCoreData
}

  

















