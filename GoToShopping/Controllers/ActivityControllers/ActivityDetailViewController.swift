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
    
    
    @IBOutlet weak var detailDescriptionTextField: UITextView!
    @IBOutlet weak var mapDetailImage: UIImageView!
    @IBOutlet weak var openingDetailLabel: UILabel!
    @IBOutlet weak var addressDetailLabel: UILabel!
    
    var activityDetailCoreData: ActivityCoreData!
    var activityMapPin: MapPin?

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

        self.title = activityDetailCoreData.nameCD
        self.detailDescriptionTextField.text = activityDetailCoreData.descriptionCD
        self.openingDetailLabel.text = activityDetailCoreData.openingHoursCD
        self.addressDetailLabel.text = activityDetailCoreData.addressCD
        
        if let image = UIImage(data: activityDetailCoreData.googleMapImageCD!){
            self.mapDetailImage.image = image
        }
    }
    
    func setActivityMapUI(){
        self.title = activityMapPin?.title
        self.detailDescriptionTextField.text = activityMapPin?.descriptionDetail
        self.addressDetailLabel.text = activityMapPin?.address
        self.openingDetailLabel.text = activityMapPin?.openingHours
        
        if let image = UIImage(data: activityDetailCoreData.googleMapImageCD!){
            self.mapDetailImage.image = image
        }
    }
}































































