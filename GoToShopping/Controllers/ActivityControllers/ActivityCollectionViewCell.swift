//
//  ActivityCollectionViewCell.swift
//  GoToShopping
//
//  Created by Alan Casas on 27/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import UIKit

class ActivityCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var activityImage: UIImageView!
    @IBOutlet weak var nameActivitiyLabel: UILabel!
    @IBOutlet weak var openingHoursActivityLabel: UILabel!
    
    var activityCD: ActivityCoreData!
    
    func refresh(activityCD: ActivityCoreData){
        self.activityCD = activityCD
        
        if let image = UIImage(data: activityCD.logoCD! as Data){
            activityImage.image = image
        }

        self.nameActivitiyLabel.text = activityCD.nameCD
        self.openingHoursActivityLabel.text = activityCD.openingHoursCD
        
    }
    
}































