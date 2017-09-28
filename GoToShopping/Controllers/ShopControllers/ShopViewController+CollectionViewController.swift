//
//  ViewController+CollectionViewController.swift
//  GoToShopping
//
//  Created by Alan Casas on 16/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import UIKit
import MapKit
import SDWebImage

extension ShopViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionInfo = fetchedResultsController.sections![section]
        return sectionInfo.numberOfObjects
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ShopCollectionViewCell
                
        let shopCoreData = fetchedResultsController.object(at: indexPath)
        
        collectionCell.refresh(shop: mapShopCoreDataIntoShop(shopCoreData: shopCoreData))

        return collectionCell
    }
    
}



extension ShopViewController{
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "shopShowDetail"{
            let indexPath = shopCollectionView.indexPathsForSelectedItems![0]            
            let vc = segue.destination as! ShopDetailViewController
            let shopToDetail = self.fetchedResultsController.object(at: indexPath)
            vc.shopDetail = mapShopCoreDataIntoShop(shopCoreData: shopToDetail)
        }
    }
}























