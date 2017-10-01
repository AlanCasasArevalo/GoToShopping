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
        collectionCell.refresh(activityCD: activityCoreData!)
        return collectionCell
    }
}

extension ActivityViewController{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let activity: ActivityCoreData = self.fetchedResultsController!.object(at: indexPath)
        isActivityMapPin = false
        self.performSegue(withIdentifier: "activityShowDetail", sender: activity)
    }
}













































