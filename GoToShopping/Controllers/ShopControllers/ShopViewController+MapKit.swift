//
//  ViewController+MapKit.swift
//  GoToShopping
//
//  Created by Alan Casas on 24/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

extension ShopViewController{
    
    func addShopAnnotationsToMap(){
        var annotationsShop:[MKAnnotation] = []
        for shopCD in (fetchedResultsController?.fetchedObjects!)! {
            let location = CLLocationCoordinate2D(latitude: CLLocationDegrees(exactly: shopCD.latitudeCD)!, longitude: CLLocationDegrees(exactly: shopCD.longitudeCD)!)
            
            let annotationPin = MapPin(coordinate: location)
            annotationPin.title = shopCD.nameCD
            annotationPin.subtitle = shopCD.openingHoursCD
            annotationsShop.append(annotationPin)
        }
        
        shopMapView.addAnnotations(annotationsShop)
    }
    
}

extension ShopViewController{
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView{
//            performSegue(withIdentifier: "moreShopDetail", sender: self)       
        }
        
    }
    
}


























