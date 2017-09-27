//
//  Activities.swift
//  GoToShopping
//
//  Created by Alan Casas on 26/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import UIKit

protocol ActivitiesProtocol {
    func count() -> Int
    func addActivity(activity: Activity)
    func getActivity(index:Int) -> Activity?
}

final class Activities : ActivitiesProtocol {
    private var activitiesList : [Activity]?
    
    public init() {
        self.activitiesList = []
    }
    
}

extension Activities{
    func count() -> Int {
        return (activitiesList?.count)!
    }
}

extension Activities{
    func addActivity(activity: Activity) {
        activitiesList?.append(activity)
    }
}

extension Activities{
    func getActivity(index: Int) -> Activity? {
        if index > (activitiesList?.count)! || index < 0 {
            return nil
        }
        return activitiesList?[index]
    }
}


