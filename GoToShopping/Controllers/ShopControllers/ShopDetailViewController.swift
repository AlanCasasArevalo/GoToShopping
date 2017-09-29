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
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = shopDetail?.name
        self.detailTextView.text = shopDetail?.description
        self.openingHoursLabel.text = shopDetail?.openingHours
        self.addressLabel.text = shopDetail?.address
        let latitude = shopDetail?.latitude ?? 40.4252643
        let longitude = shopDetail?.longitude ?? -3.6920596

//        let staticMapUrl: String =  "https://maps.googleapis.com/maps/api/staticmap?center=\(String(latitude)),\(String(longitude))&zoom=\(zoom)&size=\(size)&scale=2&markers=%7Ccolor:0x9C7B14%7C\(String(latitude)),\(String(longitude))"

        
        let staticMapUrl: String =  "https://maps.googleapis.com/maps/api/staticmap?center=\(String(latitude)),\(String(longitude))&zoom=\(zoom)&size=\(size)&scale=2&markers=%7Ccolor:0x9C7B14%7C40.4252643,-3.6920596"
        
        staticMapUrl.loadImage(imageView: mapShopDetailImage)

    }
    
}



















