//
//  MenuViewController.swift
//  GoToShopping
//
//  Created by Alan Casas on 25/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import UIKit
import CoreData
import RSLoadingView

class MenuViewController: UIViewController {
    
    var loadingView = RSLoadingView()
    var context:NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToShopping"{
            let vc = segue.destination as! ShopViewController
            vc.context = self.context
        }
        if segue.identifier == "goToActivities"{
            let vc = segue.destination as! ActivityViewController
            vc.context = self.context
        }
        
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
    
    @IBAction func goToShops(_ sender: UIButton) {
//        showOnWindow()
    }
    
    @IBAction func goToActivities(_ sender: UIButton) {
//        showOnWindow()
    }
    
    
}
