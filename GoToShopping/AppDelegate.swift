//
//  AppDelegate.swift
//  GoToShopping
//
//  Created by Alan Casas on 15/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import UIKit
import CoreData
import GoogleMaps

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coreDataStack = CoreDataStack()
    var context:NSManagedObjectContext?
    let apiKeyFromGoogleMaps = "AIzaSyAqwAB0pI49m4YX9IMzneB0H7uQHIPVS1k"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.context = coreDataStack.createContainer(dataBaseName: "GoToShopping").viewContext
        let navVC = self.window?.rootViewController as! UINavigationController
        let mainVC = navVC.topViewController as! MenuViewController
        mainVC.context = self.context
        GMSServices.provideAPIKey(apiKeyFromGoogleMaps)
        
        return true
    }
    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}

