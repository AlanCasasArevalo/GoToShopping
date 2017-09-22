//
//  ShopDetailViewController.swift
//  GoToShopping
//
//  Created by Alan Casas on 17/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import UIKit
import MapKit

class ShopDetailViewController: UIViewController {
    
    @IBOutlet weak var detailMapView: MKMapView!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var openingHoursLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var shopDetail: Shop?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = shopDetail?.name
        self.detailTextView.text = shopDetail?.description
        self.openingHoursLabel.text = shopDetail?.openingHours
        self.addressLabel.text = shopDetail?.address
    }
    
}
