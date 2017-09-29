//
//  ActivityViewController.swift
//  GoToShopping
//
//  Created by Alan Casas on 26/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import UIKit
import MapKit
import CoreData
import CoreLocation
import RSLoadingView
import SDWebImage

class ActivityViewController: UIViewController,CLLocationManagerDelegate {

    var activities:Activities?
    let locationManager = CLLocationManager()
    let cellID = "activityCell"
    var fetchedResultsController : NSFetchedResultsController<ActivityCoreData>?
    
    
    @IBOutlet weak var activitiesMap: MKMapView!
    
    @IBOutlet weak var activitiesCollection: UICollectionView!
    
    override var prefersStatusBarHidden: Bool{
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeDelegates()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeDelegates(){
        
        self.centerMapOnLocation(mapView: activitiesMap, regionRadius: 1000)
        self.addActivityAnnotationsToMap()
        self.activitiesMap.delegate = self
        self.activitiesMap.showsScale = true
        self.activitiesMap.showsUserLocation = true
        self.locationManager.delegate = self
        self.activitiesMap.reloadInputViews()        
        self.activitiesCollection.delegate = self
        self.activitiesCollection.dataSource = self
        self.activitiesCollection.reloadData()
        
    }
        
}



















