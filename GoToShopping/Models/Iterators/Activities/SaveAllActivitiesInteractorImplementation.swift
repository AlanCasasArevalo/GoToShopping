//
//  SaveAllActivitiesInteractorImplementation.swift
//  GoToShopping
//
//  Created by Alan Casas on 27/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import Foundation
import CoreData

class SaveAllActivitiesInteractorImplementation :SaveAllActivitiesInteractorProtocol  {
    
    
    func execute(activities: Activities, context: NSManagedObjectContext, onSuccess: (Activities) -> Void, onError: onErrorClosure) {
        
        for i in 0 ..< activities.count(){
            let activity = activities.getActivity(index: i)
            let _ = mapActivityintoActivityCoreData(context: context, activity: activity!)
        }
        do {
            try context.save()
            onSuccess(activities)
            activityDownloadFinished = true
            
            let activityChangeNotification = Notification(name: Notification.Name(rawValue: "activityDownloadFinished"), object: self, userInfo: ["activityDownloadCompleted" : activityDownloadFinished])

            NotificationCenter.default.post(activityChangeNotification)
            
            print("El estado en descarga de shops es: \(activityDownloadFinished)")
        }catch{
            print("Error")
        }
        
    }
    
    func execute(activities: Activities, context: NSManagedObjectContext, onSuccess: (Activities) -> Void) {
        execute(activities: activities, context: context, onSuccess: onSuccess, onError: nil)
    }
    
}



















