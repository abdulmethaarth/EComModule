//
//  GroceryCollectionViewCell.swift
//  E-Com
//
//  Created by Admin on 28/07/22.
//

import UIKit

class GroceryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var groceryImg: UIImageView!
    @IBOutlet weak var groceryLbl: UILabel!
    
    func setValues(_ grocery: GroceryItem) {
        self.groceryLbl?.text = grocery.title
        self.groceryImg?.image = grocery.image
        self.groceryImg?.superview?.backgroundColor = grocery.isSelected ? .red : .systemGray4
    }
}
