//
//  CategoryCollectionViewCell.swift
//  E-Com
//
//  Created by Admin on 27/07/22.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    func setValues(_ category: CategoryItem) {
        self.name?.text = category.title
        self.icon?.image = category.image
        self.name?.superview?.superview?.backgroundColor = category.isSelected ? .red : .white
        self.name?.superview?.superview?.layer.borderWidth = 1
        self.name?.superview?.superview?.layer.borderColor = category.isSelected ? UIColor.red.cgColor : UIColor.red.cgColor
        
        self.name?.textColor = category.isSelected ? .white : .black
    }
    
}
