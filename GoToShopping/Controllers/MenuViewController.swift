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

class MenuViewController: UIViewController {
    
    var context:NSManagedObjectContext!
    let locationManager = CLLocationManager()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToShopping"{
            let vc = segue.destination as! MainViewController
            vc.context = self.context
        }
    }

}
