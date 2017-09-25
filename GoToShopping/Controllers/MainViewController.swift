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

class MainViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var shopMapView: MKMapView!
    @IBOutlet weak var shopCollectionView: UICollectionView!
    
    let locationManager = CLLocationManager()
        
    let cellID = "CollectionCell"
    var shops:Shops?
    var shopsDownloadFinished = false
    var core = CoreDataStackSingleton()
    var context:NSManagedObjectContext!

    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.delegate = self
        self.shopMapView.delegate = self
        self.shopMapView.showsScale = true
        self.shopMapView.showsUserLocation = true
        
        centerMapOnLocation(mapView: shopMapView, regionRadius: 1000)
        addShopAnnotationsToMap()
        internetTest()
        ExecuteOnceInteractorImplementation().execute {
            initializeData()
        }
        
        self.shopCollectionView.delegate = self
        self.shopCollectionView.dataSource = self
        self.shopCollectionView.reloadData()
        self.shopMapView.reloadInputViews()
    }
        
    func initializeData () {
        let downloadShops:DownloadAllShopsIteractorProtocol = DownloadAllShopsInteractorURLSessionImpl()
        
        downloadShops.execute { (shops:Shops) in
            let cacheInteractor = SaveAllShopsInteractorImplementation()
            cacheInteractor.execute(shops: shops, context: self.context, onSuccess: { (shops: Shops) in
                
                SetExecutedOnceInteractorImplementation().execute()

                self._fetchedResultsController = nil
                self.shopCollectionView.delegate = self
                self.shopCollectionView.dataSource = self
                self.shopCollectionView.reloadData()

            })
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var _fetchedResultsController: NSFetchedResultsController<ShopCoreData>? = nil
    
    var fetchedResultsController: NSFetchedResultsController<ShopCoreData> {
        if (_fetchedResultsController != nil) {
            return _fetchedResultsController!
        }
        let fetchRequest: NSFetchRequest<ShopCoreData> = ShopCoreData.fetchRequest()
        fetchRequest.fetchBatchSize = 20
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "nameCD", ascending: true)]
        let aFetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.context!, sectionNameKeyPath: nil, cacheName: "ShopsCacheFile")

        _fetchedResultsController = aFetchedResultsController
        
        do {
            try _fetchedResultsController!.performFetch()
        } catch {
            let nserror = error as NSError
            alertControllerToView(message: "\(nserror)")
        }
        return _fetchedResultsController!
    }
    
    func internetTest(){
        if !Reachability.isConnectedToNetwork(){
            alertControllerToView(message: "Necesita tener acceso a internet para poder acceder al menos una vez a los datos.")
        }
    }
}
























