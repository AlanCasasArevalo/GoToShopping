//
//  MainViewController.swift
//  GoToShopping
//
//  Created by Alan Casas on 15/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import UIKit
import MapKit
import CoreData
import CoreLocation
import RSLoadingView
import SDWebImage

class ShopViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var shopMapView: MKMapView!
    @IBOutlet weak var shopCollectionView: UICollectionView!
    
    let locationManager = CLLocationManager()
        
    let cellID = "CollectionCell"
    var shops:Shops?
    
    var fetchedResultsController : NSFetchedResultsController<ShopCoreData>?
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeDelegates()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func initializeDelegates(){
        self.centerMapOnLocation(mapView: shopMapView, regionRadius: 1000)
        self.addShopAnnotationsToMap()
        self.shopMapView.delegate = self
        self.shopMapView.showsScale = true
        self.shopMapView.showsUserLocation = true
        self.locationManager.delegate = self
        self.shopMapView.reloadInputViews()
        self.shopCollectionView.delegate = self
        self.shopCollectionView.dataSource = self
        self.shopCollectionView.reloadData()
    }
    
}
























