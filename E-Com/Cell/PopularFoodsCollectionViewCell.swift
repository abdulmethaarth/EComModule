//
//  PopularFoodsCollectionViewCell.swift
//  E-Com
//
//  Created by Admin on 27/07/22.
//

import UIKit

class PopularFoodsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var foodImg: UIImageView!
    
    func setValues(_ foodItem: PopularFoodItem) {
        self.foodImg?.image = foodItem.image
    }
}
