//
//  ActivityDetailViewController.swift
//  GoToShopping
//
//  Created by Alan Casas on 26/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import GoogleMaps

class ActivityDetailViewController: UIViewController {
    
    var zoom = "17"
    var size = "320x220"
    var format = "PNG"
    var key = "AIzaSyAqwAB0pI49m4YX9IMzneB0H7uQHIPVS1k"
    
    var activityDetail: Activity?
    
    @IBOutlet weak var mapDetailImage: UIImageView!
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var openingDetailLabel: UILabel!
    @IBOutlet weak var addressDetailLabel: UILabel!
    
    override var prefersStatusBarHidden: Bool{
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = activityDetail?.name
        self.detailDescriptionLabel.text = activityDetail?.descriptionAct
        self.openingDetailLabel.text = activityDetail?.openingHours
        self.addressDetailLabel.text = activityDetail?.address
        let latitude = activityDetail?.latitude ?? 40.4252643
        let longitude = activityDetail?.longitude ?? -3.6920596
        
        let staticMapUrl: String =  "https://maps.googleapis.com/maps/api/staticmap?center=\(String(latitude)),\(String(longitude))&zoom=\(zoom)&size=\(size)&scale=2&markers=%7Ccolor:0x9C7B14%7C40.452048,-3.686463"

        staticMapUrl.loadImage(imageView: mapDetailImage)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}











