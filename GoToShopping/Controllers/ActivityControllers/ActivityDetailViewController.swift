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

class ActivityDetailViewController: UIViewController {
    
    var activityDetail: Activity?
    
    @IBOutlet weak var detailActivityMap: MKMapView!
    @IBOutlet weak var activityImageView: UIImageView!
    
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
        self.activityDetail?.image.loadImage(imageView: activityImageView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
