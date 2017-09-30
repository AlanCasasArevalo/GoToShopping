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

        shopImage.image = #imageLiteral(resourceName: "placeHolder")
        
        if let image = UIImage(data: shop.logo! as Data){
            shopImage.image = image
        }
        self.nameShopLabel.text = shop.name
        self.openingHoursLabel.text = shop.openingHours
    }
    
}
