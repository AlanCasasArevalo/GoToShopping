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

    if let imageData = activityCoreData.imageCD as Data? {
        activity.image = imageData as NSData
    }
    if let logoData = activityCoreData.logoCD as Data? {
        activity.logo = logoData as NSData
    }

    activity.openingHours = activityCoreData.openingHoursCD ?? ""
    activity.descriptionAct = activityCoreData.descriptionCD ?? ""
    activity.latitude = activityCoreData.latitudeCD
    activity.longitude = activityCoreData.longitudeCD
    activity.email = activityCoreData.emailCD ?? ""
    activity.telephone = activityCoreData.telephoneCD ?? ""
    activity.speciaOffer = activityCoreData.specialOfferCD
    activity.url = activityCoreData.urlCD ?? ""
//    activity.googleMapImage = (activityCoreData.googleMapImageCD! as NSData)
    
    return activity
}

func mapActivityintoActivityCoreData(context:NSManagedObjectContext, activity:Activity) -> ActivityCoreData {
    
    let activityCoreData = ActivityCoreData(context: context)
    activityCoreData.nameCD = activity.name
    activityCoreData.addressCD = activity.address
    
    if let imageCD = activity.image as Data? {
        activityCoreData.imageCD = imageCD
    }
    if let logoCD = activity.logo as Data? {
        activityCoreData.logoCD = logoCD
    }

    activityCoreData.openingHoursCD = activity.openingHours
    activityCoreData.descriptionCD = activity.descriptionAct
    activityCoreData.latitudeCD = activity.latitude ?? 0
    activityCoreData.longitudeCD = activity.longitude ?? 0
    activityCoreData.emailCD = activity.email
    activityCoreData.telephoneCD = activity.telephone
    activityCoreData.specialOfferCD = activity.speciaOffer
    activityCoreData.urlCD = activity.url
//    activityCoreData.googleMapImageCD = (activity.googleMapImage! as Data)
    
    return activityCoreData
}


















