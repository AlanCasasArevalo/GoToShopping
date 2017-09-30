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
    
//    @IBOutlet weak var detailMapView: MKMapView!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var openingHoursLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var mapShopDetailImage: UIImageView!
    
    var zoom = "17"
    var size = "320x220"
    var format = "PNG"
    var key = "AIzaSyAqwAB0pI49m4YX9IMzneB0H7uQHIPVS1k"

    var shopDetail: Shop?
    var shopMapPin: MapPin?
    var staticMapUrl: String?
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if isShopMapPin {
            setShopMapUI()
        }else{
            setShopUI()
        }
    }
    
    func setShopUI(){
        
        self.title = shopDetail?.name
        self.detailTextView.text = shopDetail?.description
        self.openingHoursLabel.text = shopDetail?.openingHours
        self.addressLabel.text = shopDetail?.address
        let latitude = shopDetail?.latitude ?? 40.4252643
        let longitude = shopDetail?.longitude ?? -3.6920596

        staticMapUrl =  "https://maps.googleapis.com/maps/api/staticmap?center=\(String(latitude)),\(String(longitude))&zoom=\(zoom)&size=\(size)&scale=2&markers=%7Ccolor:0x9C7B14%7C\(String(latitude)),\(String(longitude))"
        
        staticMapUrl?.loadImage(imageView: mapShopDetailImage)
    }
    
    func setShopMapUI(){
        self.title = shopMapPin?.title
        self.detailTextView.text = shopMapPin?.descriptionDetail
        self.addressLabel.text = shopMapPin?.address
        self.openingHoursLabel.text = shopMapPin?.openingHours
        
        let latitude = shopMapPin?.coordinate.latitude ?? 40.4252643
        let longitude = shopMapPin?.coordinate.longitude ?? -3.6920596
        
        print(latitude)
        print(longitude)

//        staticMapUrl =  "https://maps.googleapis.com/maps/api/staticmap?center=\(String(latitude)),\(String(longitude))&zoom=\(zoom)&size=\(size)&scale=2"
        
        staticMapUrl =  "https://maps.googleapis.com/maps/api/staticmap?center=\(String(latitude)),\(String(longitude))&zoom=\(zoom)&size=\(size)&scale=2&markers=%7Ccolor:0x9C7B14%7C\(String(latitude)),\(String(longitude))"
        
        staticMapUrl?.loadImage(imageView: mapShopDetailImage)

    }
    
}



















