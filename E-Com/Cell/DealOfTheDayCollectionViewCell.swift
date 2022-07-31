//
//  DealOfTheDayCollectionViewCell.swift
//  E-Com
//
//  Created by Admin on 27/07/22.
//

import UIKit

class DealOfTheDayCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    func setValues(_ deals: DealItem) {
        self.name?.text = deals.title
        self.icon?.image = deals.image
        self.name?.superview?.backgroundColor = deals.isSelected ? .red : .white
        self.name?.superview?.layer.borderWidth = 1
        self.name?.superview?.layer.borderColor = deals.isSelected ? UIColor.red.cgColor : UIColor.red.cgColor
        
        self.name?.textColor = deals.isSelected ? .white : .black
    }
    
}
