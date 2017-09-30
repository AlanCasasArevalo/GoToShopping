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
    var staticMapUrl: String?
    
    var activityDetail: Activity?
    var activityMapPin: MapPin?
    

    @IBOutlet weak var detailDescriptionTextField: UITextView!
    @IBOutlet weak var mapDetailImage: UIImageView!
    @IBOutlet weak var openingDetailLabel: UILabel!
    @IBOutlet weak var addressDetailLabel: UILabel!
    
    override var prefersStatusBarHidden: Bool{
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        if isActivityMapPin {
            setActivityMapUI()
        }else{
            setActivityUI()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setActivityUI(){

        self.title = activityDetail?.name
        self.detailDescriptionTextField.text = activityDetail?.descriptionAct
        self.openingDetailLabel.text = activityDetail?.openingHours
        self.addressDetailLabel.text = activityDetail?.address
        let latitude = activityDetail?.latitude ?? 40.4252643
        let longitude = activityDetail?.longitude ?? -3.6920596
        
//        let staticMapUrl: String =  "https://maps.googleapis.com/maps/api/staticmap?center=\(String(latitude)),\(String(longitude))&zoom=\(zoom)&size=\(size)&scale=2&markers=%7Ccolor:0x9C7B14%7C40.452048,-3.686463"

        staticMapUrl =  "https://maps.googleapis.com/maps/api/staticmap?center=\(String(latitude)),\(String(longitude))&zoom=\(zoom)&size=\(size)&scale=2&markers=%7Ccolor:0x9C7B14%7C\(String(latitude)),\(String(longitude))"

        staticMapUrl?.loadImage(imageView: mapDetailImage)
    }
    
    func setActivityMapUI(){
        self.title = activityMapPin?.title
        self.detailDescriptionTextField.text = activityMapPin?.descriptionDetail
        self.addressDetailLabel.text = activityMapPin?.address
        self.openingDetailLabel.text = activityMapPin?.openingHours
        
        let latitude = activityMapPin?.coordinate.latitude ?? 40.4252643
        let longitude = activityMapPin?.coordinate.longitude ?? -3.6920596
        
        print(latitude)
        print(longitude)
        
        //        staticMapUrl =  "https://maps.googleapis.com/maps/api/staticmap?center=\(String(latitude)),\(String(longitude))&zoom=\(zoom)&size=\(size)&scale=2"
        
        staticMapUrl =  "https://maps.googleapis.com/maps/api/staticmap?center=\(String(latitude)),\(String(longitude))&zoom=\(zoom)&size=\(size)&scale=2&markers=%7Ccolor:0x9C7B14%7C\(String(latitude)),\(String(longitude))"
        
        staticMapUrl?.loadImage(imageView: mapDetailImage)
        
    }

}











