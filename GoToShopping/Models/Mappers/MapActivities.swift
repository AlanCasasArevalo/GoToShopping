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
    activity.image = activityCoreData.imageCD ?? ""
    activity.logo = activityCoreData.logoCD ?? ""
    activity.openingHours = activityCoreData.openingHoursCD ?? ""
    activity.descriptionAct = activityCoreData.descriptionCD ?? ""
    activity.latitude = activityCoreData.latitudeCD
    activity.longitude = activityCoreData.longitudeCD
    activity.email = activityCoreData.emailCD ?? ""
    activity.telephone = activityCoreData.telephoneCD ?? ""
    activity.speciaOffer = activityCoreData.specialOfferCD
    activity.url = activityCoreData.urlCD ?? ""
    
    return activity
}

func mapActivityintoActivityCoreData(context:NSManagedObjectContext, activity:Activity) -> ActivityCoreData {
    
    let activityCoreData = ActivityCoreData(context: context)
    activityCoreData.nameCD = activity.name
    activityCoreData.addressCD = activity.address
    activityCoreData.imageCD = activity.image
    activityCoreData.logoCD = activity.logo
    activityCoreData.openingHoursCD = activity.openingHours
    activityCoreData.descriptionCD = activity.descriptionAct
    activityCoreData.latitudeCD = activity.latitude ?? 0
    activityCoreData.longitudeCD = activity.longitude ?? 0
    activityCoreData.emailCD = activity.email
    activityCoreData.telephoneCD = activity.telephone
    activityCoreData.specialOfferCD = activity.speciaOffer
    activityCoreData.urlCD = activity.url
    
    return activityCoreData
}


















