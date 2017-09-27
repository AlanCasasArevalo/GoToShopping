//
//  ActivityCollectionViewCell.swift
//  GoToShopping
//
//  Created by Alan Casas on 27/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import UIKit

class ActivityCollectionViewCell: UICollectionViewCell {
    var activity: Activity?
    
    @IBOutlet weak var activityImage: UIImageView!
    
    @IBOutlet weak var nameActivitiyLabel: UILabel!
    
    @IBOutlet weak var openingHoursActivityLabel: UILabel!
    
    func refresh(activity: Activity){
        self.activity = activity
        
        self.nameActivitiyLabel.text = activity.name
        self.openingHoursActivityLabel.text = activity.openingHours
        self.activity?.logo.loadImage(imageView: activityImage)
        
    }
    
}