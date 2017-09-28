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
    var loadingView : RSLoadingView?
    let locationManager = CLLocationManager()
    let cellID = "activityCell"
    var core = CoreDataStack()
    var context:NSManagedObjectContext!
    var activityValueForCoreData: String = "ActivitySaved"
    var activityKeyForCoreData: String = "activityOnce"
    
    @IBOutlet weak var activitiesMap: MKMapView!
    
    @IBOutlet weak var activitiesCollection: UICollectionView!
    
    override var prefersStatusBarHidden: Bool{
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        internetTest()
        
        ExecuteOnceInteractorImplementation().execute(clousure: {
            initializeData()
        }, key: activityKeyForCoreData)
        
        initializeDelegates()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeData () {
        let downloadActivities:DownloadAllActivitiesInteractorProtocol = DownloadAllActivitiesInteractorWithURLSessionImplementation()

        downloadActivities.execute { (activities: Activities) in

            let cacheInteractor = SaveAllActivitiesInteractorImplementation()
            cacheInteractor.execute(activities: activities, context: self.context, onSuccess: { (activities: Activities) in

                SetExecutedOnceInteractorImplementation().execute(value: self.activityValueForCoreData, key: self.activityKeyForCoreData)
                self._fetchedResultsController = nil
                self.initializeDelegates()
                
            })
        }
//        self.loadingView?.hide()
//        self.loadingView?.removeFromSuperview()
    }
    
    var _fetchedResultsController: NSFetchedResultsController<ActivityCoreData>? = nil
    
    var fetchedResultsController: NSFetchedResultsController<ActivityCoreData> {
        if (_fetchedResultsController != nil) {
            return _fetchedResultsController!
        }
        let fetchRequest: NSFetchRequest<ActivityCoreData> = ActivityCoreData.fetchRequest()
        fetchRequest.fetchBatchSize = 20
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "nameCD", ascending: true)]
        let aFetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.context!, sectionNameKeyPath: nil, cacheName: "ActivitiesCacheFile")
        
        _fetchedResultsController = aFetchedResultsController
        
        do {
            try _fetchedResultsController!.performFetch()
        } catch {
            let nserror = error as NSError
            alertControllerToView(message: "\(nserror)")
        }
        
        return _fetchedResultsController!
        
    }
    
    func initializeDelegates(){
        
        self.centerMapOnLocation(mapView: activitiesMap, regionRadius: 1000)
        self.addActivityAnnotationsToMap()
        self.activitiesMap.delegate = self
        self.activitiesMap.showsScale = true
        self.activitiesMap.showsUserLocation = true
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.delegate = self
        self.activitiesMap.reloadInputViews()
        
        self.activitiesCollection.delegate = self
        self.activitiesCollection.dataSource = self
        self.activitiesCollection.reloadData()
        
    }

    func internetTest(){
        if !Reachability.isConnectedToNetwork(){
            alertControllerToView(message: "Necesita tener acceso a internet para poder acceder al menos una vez a los datos.")
        }
    }
}
