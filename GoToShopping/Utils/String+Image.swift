//
//  String+Image.swift
//  GoToShopping
//
//  Created by Alan Casas on 16/9/17.
//  Copyright © 2017 Alan. All rights reserved.
//

import UIKit
import SDWebImage



extension String{
    func loadImage(imageView: UIImageView) {
        let queue = OperationQueue()
        queue.addOperation {
            if let url = URL(string: self){
                OperationQueue.main.addOperation {
                    imageView.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "placeHolder"), options: [.continueInBackground, .refreshCached, .highPriority, .retryFailed], completed: nil)
                }
            }
        }
    }
}




















