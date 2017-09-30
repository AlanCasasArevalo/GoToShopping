//
//  ActivityViewController+MapKit.swift
//  GoToShopping
//
//  Created by Alan Casas on 27/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

extension ActivityViewController{
    
    func addActivityAnnotationsToMap(){
        var annotationsActivity:[MKAnnotation] = []
        for activityCD in (fetchedResultsController?.fetchedObjects!)! {
            let location = CLLocationCoordinate2D(latitude: CLLocationDegrees(exactly: activityCD.latitudeCD)!, longitude: CLLocationDegrees(exactly: activityCD.longitudeCD)!)
            
            let annotationPin = MapPin(coordinate: location)
            annotationPin.title = activityCD.nameCD
            annotationPin.descriptionDetail = activityCD.descriptionCD
            annotationPin.address = activityCD.addressCD
            annotationPin.openingHours = activityCD.openingHoursCD
            annotationsActivity.append(annotationPin)
        }
        activitiesMap.addAnnotations(annotationsActivity)
    }
}



