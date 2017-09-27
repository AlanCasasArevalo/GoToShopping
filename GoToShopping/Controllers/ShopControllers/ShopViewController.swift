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

    var loadingView = RSLoadingView()

    @IBOutlet weak var shopMapView: MKMapView!
    @IBOutlet weak var shopCollectionView: UICollectionView!
    
    let locationManager = CLLocationManager()
        
    let cellID = "CollectionCell"
    var shops:Shops?
    var core = CoreDataStack()
    var context:NSManagedObjectContext!
    var valueForCoreData: String = "Shop Saved"
    var keyForCoreData: String = "shopOnce"

    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        showOnWindow()
        
        internetTest()

        
        ExecuteOnceInteractorImplementation().execute(clousure: {
            initializeData()
        }, key: keyForCoreData)
        
        
    }
    
    
    func initializeData () {
        let downloadShops:DownloadAllShopsIteractorProtocol = DownloadAllShopsInteractorURLSessionImpl()
        
        downloadShops.execute { (shops:Shops) in
            let cacheInteractor = SaveAllShopsInteractorImplementation()
            cacheInteractor.execute(shops: shops, context: self.context, onSuccess: { (shops: Shops) in
                
                SetExecutedOnceInteractorImplementation().execute(value: self.valueForCoreData, key: self.keyForCoreData)

                self._shopFetchedResultsController = nil
                self.initializeDelegates()

            })
            self.loadingView.hide()
            self.loadingView.removeFromSuperview()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    var _shopFetchedResultsController: NSFetchedResultsController<ShopCoreData>? = nil
    
    var shopFetchedResultsController: NSFetchedResultsController<ShopCoreData> {
        if (_shopFetchedResultsController != nil) {
            return _shopFetchedResultsController!
        }
        let shopFetchRequest: NSFetchRequest<ShopCoreData> = ShopCoreData.fetchRequest()
        
//        let entity = NSEntityDescription.entity(forEntityName: "ShopCoreData", in: self.context)
//        let shopCore = ShopCoreData(entity: entity!, insertInto: self.context)
        
        
        
        shopFetchRequest.fetchBatchSize = 20
        shopFetchRequest.sortDescriptors = [NSSortDescriptor(key: "nameCD", ascending: true)]
        let shopFetchedResultsController = NSFetchedResultsController(fetchRequest: shopFetchRequest, managedObjectContext: self.context!, sectionNameKeyPath: nil, cacheName: "ShopsCacheFile")

        
        _shopFetchedResultsController = shopFetchedResultsController
        
        do {
            try _shopFetchedResultsController!.performFetch()
        } catch {
            let nserror = error as NSError
            alertControllerToView(message: "\(nserror)")
        }

        return _shopFetchedResultsController!
        
    }
    
    func internetTest(){
        if !Reachability.isConnectedToNetwork(){
            alertControllerToView(message: "Necesita tener acceso a internet para poder acceder al menos una vez a los datos.")
        }
    }
    
    func initializeDelegates(){
    
        self.centerMapOnLocation(mapView: shopMapView, regionRadius: 1000)
        self.addShopAnnotationsToMap()
        self.shopMapView.delegate = self
        self.shopMapView.showsScale = true
        self.shopMapView.showsUserLocation = true
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.delegate = self
        self.shopMapView.reloadInputViews()
        
        self.shopCollectionView.delegate = self
        self.shopCollectionView.dataSource = self
        self.shopCollectionView.reloadData()
    }
    
    func showOnWindow() {
        loadingView = RSLoadingView(effectType: RSLoadingView.Effect.twins)
        loadingView.mainColor = UIColor(red: 72, green: 176, blue: 226, alpha: 0.8)
        loadingView.shouldTapToDismiss = false
        loadingView.isBlocking = true
        loadingView.variantKey = "inAndOut"
        loadingView.speedFactor = 1.0
        loadingView.sizeFactor = 2.0
        //        loadingView.lifeSpanFactor = 5.0
        loadingView.show(on: view)
    }
    

}
























