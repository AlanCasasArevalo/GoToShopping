//
//  ViewController+Map.swift
//  GoToShopping
//
//  Created by Alan Casas on 24/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

extension UIViewController{
    func centerMapOnLocation( mapView:MKMapView, regionRadius: CLLocationDistance){
        let madridLocation = CLLocation(latitude: 40.4252643, longitude: -3.6920596)
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(madridLocation.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }    
}

extension UIViewController: MKMapViewDelegate {
    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
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

extension ShopViewController {
    public func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView{
            isShopMapPin = true
            performSegue(withIdentifier: "shopShowDetail", sender: view.annotation as! MapPin)
        }
    }
}

extension ActivityViewController {
    public func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView{            
            isActivityMapPin = true
            performSegue(withIdentifier: "activityShowDetail", sender: view.annotation as! MapPin)
        }
    }
}















