//
//  CategoryTableViewCell.swift
//  E-Com
//
//  Created by Admin on 27/07/22.
//

import UIKit

class CategoryItem {
    
    var title: String!
    var image: UIImage!
    var isSelected: Bool! = false
    
    init(title: String!, image: UIImage!, isSelected: Bool = false) {
        self.title = title
        self.image = image
        self.isSelected = isSelected
    }
}

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var categories = [
        CategoryItem(title: "Food", image: #imageLiteral(resourceName: "food").withRenderingMode(.alwaysOriginal)),
        CategoryItem(title: "Grocery", image: #imageLiteral(resourceName: "grocery").withRenderingMode(.alwaysOriginal)),
        CategoryItem(title: "Meat", image: #imageLiteral(resourceName: "red-meats-hd-png-101576840775j7gea3aryi").withRenderingMode(.alwaysOriginal)),
        CategoryItem(title: "Veg", image: #imageLiteral(resourceName: "veg").withRenderingMode(.alwaysOriginal)),
        CategoryItem(title: "Ice", image: #imageLiteral(resourceName: "ice_cream").withRenderingMode(.alwaysOriginal)),
        CategoryItem(title: "Candies", image: #imageLiteral(resourceName: "Jelly-Candy-PNG-HD").withRenderingMode(.alwaysOriginal))
    ]

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension CategoryTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategoryCollectionViewCell = collectionView.dequeueCell(indexPath)
        cell.setValues(self.categories[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.categories.forEach {
            $0.isSelected = false
        }
        self.categories[indexPath.item].isSelected = true
        collectionView.reloadData()
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        var size = collectionView.bounds.size
//        size.width = size.height
//        return size
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = collectionView.bounds.size
        size.width -= 25
        size.width /= 4
        return size
    }
}
