//
//  ActivityViewController+CollectionViewController.swift
//  GoToShopping
//
//  Created by Alan Casas on 27/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import Foundation
import MapKit
import SDWebImage

extension ActivityViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionInfo = fetchedResultsController?.sections![section]
        return sectionInfo!.numberOfObjects
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ActivityCollectionViewCell
        
        let activityCoreData = fetchedResultsController?.object(at: indexPath)
        
        collectionCell.refresh(activity: mapActivityCoreDataIntoActivity(activityCoreData: activityCoreData!))
        
        return collectionCell
    }
}

extension ActivityViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "activityShowDetail"{
            let indexPath = activitiesCollection.indexPathsForSelectedItems![0]
            let vc = segue.destination as! ActivityDetailViewController
            let activityToDetail = self.fetchedResultsController?.object(at: indexPath)
            vc.activityDetail = mapActivityCoreDataIntoActivity(activityCoreData: activityToDetail!)
        }
    }
}



