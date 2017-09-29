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

struct imageForButtons {
    
    let shopButtonImage = "shopping"
    let activityButtonImage = "activities"
    
}

var downloadFinished = false
var shopsSaved = false
var activitiesSaved = false

class MenuViewController: UIViewController {
    
    var context:NSManagedObjectContext!
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    let locationManager = CLLocationManager()
    
    var core = CoreDataStack()
    
    var valueForCoreData: String = "Saved"
    var keyForCoreData: String = "Once"
    
    @IBOutlet weak var shopButton: UIButton!
    @IBOutlet weak var activityButton: UIButton!
    
    var shops:Shops?
    var activities: Activities?
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        internetTest()
        
        self.locationManager.requestWhenInUseAuthorization()
        
        setUI()
        
        ExecuteOnceInteractorImplementation().execute {
            
            REVISAR
            algo no funciona con la base de datos o algo similar porque entramos aqui todo el tiempo
            
            startAnimating()
            initializeData()
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(donwloadAndSaveCompleted), name: NSNotification.Name(rawValue: "downloadFinished"), object: nil)
        
    }
    
    func setUI (){
        shopButton.imageView?.image = UIImage(named: imageForButtons.init().shopButtonImage)
        activityButton.imageView?.image = UIImage(named: imageForButtons.init().activityButtonImage)
        
        shopButton.imageView?.contentMode = .scaleAspectFit
        activityButton.imageView?.contentMode = .scaleAspectFit
        
        shopButton.isEnabled = false
        activityButton.isEnabled = false
    }
    
    func startAnimating(){
        
        UIApplication.shared.beginIgnoringInteractionEvents()
        activityIndicator.startAnimating()
        activityIndicator.center = CGPoint(x: view.center.x, y: view.center.y)
        view.backgroundColor = UIColor.darkGray
        view.addSubview(activityIndicator)
        
    }
    
    @objc func donwloadAndSaveCompleted(){

        print("El estado de descarga de tiendas y actividades en Menu es  \(downloadFinished)")

//        if downloadFinished && shopsSaved && activitiesSaved  {
        if downloadFinished   {
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
    
    func initializeData () {
        
        let download:DownloadAllIteractorProtocol = DownloadAllInteractorNSOpImplementation()
        
        download.execute { (shops, activities) in
            
            let cacheInteractor = SaveAllInteractorImplementation()
            cacheInteractor.execute(shops: shops, activities: activities, context: self.context, onSuccess: { (shops: Shops, activities: Activities) in
                
                SetExecutedOnceInteractorImplementation().execute()
                self._activityFetchedResultsController = nil
                self._shopFetchedResultsController = nil

            })
            
        }
        
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
        
        shopsSaved = true
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
        
        activitiesSaved = true
        return _activityFetchedResultsController!
        
    }
    
}
