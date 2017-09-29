//
//  MenuViewController.swift
//  GoToShopping
//
//  Created by Alan Casas on 25/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation
import RSLoadingView

var activityDownloadFinished = false
var shopDownloadFinished = false
var activitySaveFinished = false
var shopSaveFinished = false
var mapShopImageDownloadFinished = false
var mapActivityImageDownloadFinished = false

struct imageForButtons {
    
    let shopButtonImage = "shopping"
    let activityButtonImage = "activities"
    
}

class MenuViewController: UIViewController {
    
    var context:NSManagedObjectContext!
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    let locationManager = CLLocationManager()
    
    var core = CoreDataStack()
    
    var shopValueForCoreData: String = "ShopSaved"
    var shopKeyForCoreData: String = "shopOnce"
    
    var activityValueForCoreData: String = "ActivitySaved"
    var activityKeyForCoreData: String = "activityOnce"
    
    @IBOutlet weak var shopButton: UIButton!
    @IBOutlet weak var activityButton: UIButton!
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        internetTest()
        
        self.locationManager.requestWhenInUseAuthorization()
        
        shopButton.imageView?.image = UIImage(named: imageForButtons.init().shopButtonImage)
        activityButton.imageView?.image = UIImage(named: imageForButtons.init().activityButtonImage)
        
        shopButton.imageView?.contentMode = .scaleAspectFit
        activityButton.imageView?.contentMode = .scaleAspectFit
        
        initializeAllDownloadFromEthernetOnce()
        
        NotificationCenter.default.addObserver(self, selector: #selector(donwloadAndSaveCompleted), name: NSNotification.Name(rawValue: "shopDownloadFinished"), object: nil)
        
    }
    
    func startAnimating(){
        
        UIApplication.shared.beginIgnoringInteractionEvents()
        activityIndicator.startAnimating()
        activityIndicator.center = CGPoint(x: view.center.x, y: view.center.y)
        view.backgroundColor = UIColor.darkGray
        view.addSubview(activityIndicator)
        
    }
    
    @objc func donwloadAndSaveCompleted(){

        print("El estado de descarga de tiendas y actividades en Menu es  \(shopDownloadFinished) \(activityDownloadFinished) \(activitySaveFinished) \(shopSaveFinished)")
//        if shopDownloadFinished && activityDownloadFinished && activitySaveFinished && shopSaveFinished{
        if shopDownloadFinished && activityDownloadFinished  {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.hidesWhenStopped = true
            self.view.backgroundColor = UIColor.white
            self.shopButton.isEnabled = true
            self.activityButton.isEnabled = true
            UIApplication.shared.endIgnoringInteractionEvents()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToShopping"{
            let vc = segue.destination as! ShopViewController
            vc.fetchedResultsController = self.shopFetchedResultsController
        }
        if segue.identifier == "goToActivities"{
            let vc = segue.destination as! ActivityViewController
            vc.fetchedResultsController = self.activityFetchedResultsController
        }
    }
    
    func internetTest(){
        if !Reachability.isConnectedToNetwork(){
            alertControllerToView(message: "Necesita tener acceso a internet para poder acceder al menos una vez a los datos.")
        }
    }
    
    @objc func initializeAllDownloadFromEthernetOnce(){
        
        ExecuteOnceInteractorImplementation().execute(clousure: {
            initializeShopData()
        }, key: shopKeyForCoreData)
        
        ExecuteOnceInteractorImplementation().execute(clousure: {
            initializeActivityData()
        }, key: activityKeyForCoreData)
        
    }
    
    func initializeShopData () {
        
        let downloadShops:DownloadAllShopsIteractorProtocol = DownloadAllShopsInteractorURLSessionImpl()
        
        downloadShops.execute { (shops:Shops) in
            let cacheInteractor = SaveAllShopsInteractorImplementation()
            cacheInteractor.execute(shops: shops, context: self.context, onSuccess: { (shops: Shops) in
                
                SetExecutedOnceInteractorImplementation().execute(value: self.shopValueForCoreData, key: self.shopKeyForCoreData)
                self._shopFetchedResultsController = nil
                
            })
        }
    }
    
    func initializeActivityData () {

        let downloadActivities:DownloadAllActivitiesInteractorProtocol = DownloadAllActivitiesInteractorWithURLSessionImplementation()
        
        downloadActivities.execute { (activities: Activities) in
            
            let cacheInteractor = SaveAllActivitiesInteractorImplementation()
            cacheInteractor.execute(activities: activities, context: self.context, onSuccess: { (activities: Activities) in
                
                SetExecutedOnceInteractorImplementation().execute(value: self.activityValueForCoreData, key: self.activityKeyForCoreData)
                
                self._activityFetchedResultsController = nil
            })
        }
        startAnimating()
        
    }
    
    var _shopFetchedResultsController: NSFetchedResultsController<ShopCoreData>? = nil
    
    var shopFetchedResultsController : NSFetchedResultsController<ShopCoreData> {
        if (_shopFetchedResultsController != nil) {
            return _shopFetchedResultsController!
        }
        
        let shopFetchRequest: NSFetchRequest<ShopCoreData> = ShopCoreData.fetchRequest()
        
        shopFetchRequest.fetchBatchSize = 20
        shopFetchRequest.sortDescriptors = [NSSortDescriptor(key: "nameCD", ascending: true)]
        let aShopFetchedResultsController = NSFetchedResultsController(fetchRequest: shopFetchRequest, managedObjectContext: self.context!, sectionNameKeyPath: nil, cacheName: "ShopsCacheFile")
        
        _shopFetchedResultsController = aShopFetchedResultsController
        
        do {
            try _shopFetchedResultsController!.performFetch()
        } catch {
            let nserror = error as NSError
            alertControllerToView(message: "\(nserror)")
        }
        
        shopSaveFinished = true
        print("El estado de las tiendas guardadas es: \(shopSaveFinished)")
        return _shopFetchedResultsController!
        
    }
    
    var _activityFetchedResultsController: NSFetchedResultsController<ActivityCoreData>? = nil
    
    var activityFetchedResultsController: NSFetchedResultsController<ActivityCoreData> {
        if (_activityFetchedResultsController != nil) {
            return _activityFetchedResultsController!
        }
        let activityFetchRequest: NSFetchRequest<ActivityCoreData> = ActivityCoreData.fetchRequest()
        activityFetchRequest.fetchBatchSize = 20
        activityFetchRequest.sortDescriptors = [NSSortDescriptor(key: "nameCD", ascending: true)]
        let anActivityFetchedResultsController = NSFetchedResultsController(fetchRequest: activityFetchRequest, managedObjectContext: self.context!, sectionNameKeyPath: nil, cacheName: "ActivitiesCacheFile")
        
        _activityFetchedResultsController = anActivityFetchedResultsController
        
        do {
            try _activityFetchedResultsController?.performFetch()
        } catch {
            let nserror = error as NSError
            alertControllerToView(message: "\(nserror)")
        }
        
        activitySaveFinished = true
        print("El estado de las actividades guardadas es: \(activitySaveFinished)")
        return _activityFetchedResultsController!
        
    }
    
}
