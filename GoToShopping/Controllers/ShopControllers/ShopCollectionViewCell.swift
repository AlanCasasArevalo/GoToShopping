//
//  ShopCollectionViewCell.swift
//  GoToShopping
//
//  Created by Alan Casas on 16/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import UIKit

class ShopCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameShopLabel: UILabel!
    @IBOutlet weak var openingHoursLabel: UILabel!
    @IBOutlet weak var shopImage: UIImageView!
    var shop:ShopCoreData!
    
    func refresh(shop:ShopCoreData){
        self.shop = shop
        
        if let image = UIImage(data: shop.logoCD! as Data){
            shopImage.image = image
        }
        
        self.nameShopLabel.text = shop.nameCD
        self.openingHoursLabel.text = shop.openingHoursCD
    }
    
}































