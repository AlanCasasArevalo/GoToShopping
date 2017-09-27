//
//  ShopDetailViewController.swift
//  GoToShopping
//
//  Created by Alan Casas on 17/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ShopDetailViewController: UIViewController {
    
    @IBOutlet weak var detailMapView: MKMapView!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var openingHoursLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var shopDetail: Shop?
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = shopDetail?.name
        self.detailTextView.text = shopDetail?.description
        self.openingHoursLabel.text = shopDetail?.openingHours
        self.addressLabel.text = shopDetail?.address
        self.detailMapView.showsScale = true
        self.detailMapView.showsUserLocation = true
        self.detailMapView.delegate = self
        
        centerMapOnLocation(mapView: detailMapView, regionRadius: 70)
        let shopLocation = CLLocationCoordinate2D(latitude:CLLocationDegrees(exactly: (shopDetail?.latitude)!)!, longitude: CLLocationDegrees(exactly: (shopDetail?.longitude)!)!)
        detailMapView.setCenter(shopLocation, animated: true)

        let shopAnnotation = MapPin(coordinate: shopLocation)
        shopAnnotation.title = shopDetail?.name
        shopAnnotation.subtitle = shopDetail?.openingHours
        detailMapView.addAnnotation(shopAnnotation)
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
//            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        
        if let annotationView = annotationView {            
            annotationView.canShowCallout = true
            annotationView.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
            annotationView.image = #imageLiteral(resourceName: "location")
        }
        
        return annotationView
        
    }
}
















