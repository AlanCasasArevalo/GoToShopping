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

    @IBOutlet weak var activitiesMap: MKMapView!
    @IBOutlet weak var activitiesCollection: UICollectionView!

    let locationManager = CLLocationManager()
    let cellID = "activityCell"
    var fetchedResultsController : NSFetchedResultsController<ActivityCoreData>?

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

extension ActivityViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "activityShowDetail"{
            let vc = segue.destination as! ActivityDetailViewController
            
            if sender is ActivityCoreData{
                let indexPath = activitiesCollection.indexPathsForSelectedItems![0]
                let activityToDetail = self.fetchedResultsController?.object(at: indexPath)
                vc.activityDetailCoreData = activityToDetail!
            }
            if sender is MapPin {
                let activityMapPinDetail = sender as! MapPin
                vc.activityMapPin = activityMapPinDetail                
            }
        }
    }
}










































