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
    
    var shopDetailCoreData: ShopCoreData?
    var shopMapPin: MapPin?
    
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
        
        self.title = shopDetailCoreData?.nameCD
        self.detailTextView.text = shopDetailCoreData?.descriptionCD
        self.openingHoursLabel.text = shopDetailCoreData?.openingHoursCD
        self.addressLabel.text = shopDetailCoreData?.addressCD

        if let image = UIImage(data: (shopDetailCoreData?.imageCD)!){
            self.mapShopDetailImage.image = image
        }
        
    }
    
    func setShopMapUI(){
        self.title = shopMapPin?.title
        self.detailTextView.text = shopMapPin?.descriptionDetail
        self.addressLabel.text = shopMapPin?.address
        self.openingHoursLabel.text = shopMapPin?.openingHours
        
        if let image = UIImage(data: (shopMapPin?.imageData)!){
            self.mapShopDetailImage.image = image
        }

    }
    
}
























































