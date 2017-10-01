//
//  MapPin.swift
//  GoToShopping
//
//  Created by Alan Casas on 25/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapPin: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle:String?
    var openingHours: String?
    var address: String?
    var descriptionDetail:String?
    var imageData: Data?
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}













