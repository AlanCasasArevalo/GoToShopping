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
        for activityCD in activityFetchedResultsController.fetchedObjects! {
            let location = CLLocationCoordinate2D(latitude: CLLocationDegrees(exactly: activityCD.latitudeCD)!, longitude: CLLocationDegrees(exactly: activityCD.longitudeCD)!)
            
            let annotationPin = MapPin(coordinate: location)
            annotationPin.title = activityCD.nameCD
            annotationPin.subtitle = activityCD.openingHoursCD
            annotationsActivity.append(annotationPin)
        }
        
        activitiesMap.addAnnotations(annotationsActivity)
    }
    
}

extension ActivityViewController{
    
    override func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationIdentifier = "AnnotationIdentifier"
        
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        var annotationView: MKAnnotationView?
        
        
        if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) {
            annotationView = dequeuedAnnotationView
            annotationView?.annotation = annotation
        }
        else {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
        }
        
        if let annotationView = annotationView {
            annotationView.canShowCallout = true
            annotationView.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
            annotationView.image = #imageLiteral(resourceName: "location")
        }
        
        return annotationView
        
    }
}


