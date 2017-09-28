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

extension UIViewController {
    
    public func mapViewDidFinishRenderingMap(_ mapView: MKMapView, fullyRendered: Bool) {
        
        
        
    }
    
}

















