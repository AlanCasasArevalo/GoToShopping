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
    var shop:Shop?
    
    func refresh(shop:Shop){
        self.shop = shop
        self.shopImage.layer.cornerRadius = 25
        shop.logo.loadImage(imageView: self.shopImage)
        self.nameShopLabel.text = shop.name
        self.openingHoursLabel.text = shop.openingHours
    }
    
}
