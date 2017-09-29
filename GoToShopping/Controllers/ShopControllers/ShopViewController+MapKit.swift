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
            annotationView.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
            annotationView.image = #imageLiteral(resourceName: "location")
        }

        return annotationView

    }
}

extension ShopViewController{
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView{
//            performSegue(withIdentifier: "moreShopDetail", sender: self)       
        }
        
    }
    
}


























