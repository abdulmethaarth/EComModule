//
//  GroceryTableViewCell.swift
//  E-Com
//
//  Created by Admin on 28/07/22.
//

import UIKit

class GroceryItem {
    var title: String!
    var image: UIImage!
    var isSelected: Bool! = false
    
    init(title: String!, image: UIImage!, isSelected: Bool = false) {
        self.title = title
        self.image = image
        self.isSelected = isSelected
    }
}

class GroceryTableViewCell: UITableViewCell {
    var controller: String!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var button: UIButton!
    
    var groceries = [
        GroceryItem(title: "Fruites", image: #imageLiteral(resourceName: "Fruites").withRenderingMode(.alwaysOriginal)),
        GroceryItem(title: "Vegitables", image: #imageLiteral(resourceName: "veg").withRenderingMode(.alwaysOriginal)),
        GroceryItem(title: "Juice", image: #imageLiteral(resourceName: "juice").withRenderingMode(.alwaysOriginal)),
        GroceryItem(title: "Meat", image: #imageLiteral(resourceName: "red-meats-hd-png-101576840775j7gea3aryi").withRenderingMode(.alwaysOriginal)),
        GroceryItem(title: "Ice Cream", image: #imageLiteral(resourceName: "ice_cream").withRenderingMode(.alwaysOriginal)),
        GroceryItem(title: "Candies", image: #imageLiteral(resourceName: "Jelly-Candy-PNG-HD").withRenderingMode(.alwaysOriginal))
    ]
    
    var meats = [
        GroceryItem(title: "Chicken", image: #imageLiteral(resourceName: "chicken_meat").withRenderingMode(.alwaysOriginal)),
        GroceryItem(title: "Seafood", image: #imageLiteral(resourceName: "fish_PNG25111").withRenderingMode(.alwaysOriginal)),
        GroceryItem(title: "Mutton", image: #imageLiteral(resourceName: "249-2498321_mutton-curry-pieces-fresh-mutton-cut-piece").withRenderingMode(.alwaysOriginal)),
        GroceryItem(title: "Beaf", image: #imageLiteral(resourceName: "red-meats-hd-png-101576840775j7gea3aryi").withRenderingMode(.alwaysOriginal)),
        GroceryItem(title: "Coldcuts", image: #imageLiteral(resourceName: "249-2498321_mutton-curry-pieces-fresh-mutton-cut-piece").withRenderingMode(.alwaysOriginal)),
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension GroceryTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if controller == "Meats"{
            button.setTitle("Browse more on Meats", for: .normal)
            return meats.count
        }else {
            button.setTitle("Browse more on Grocery", for: .normal)
            return groceries.count
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: GroceryCollectionViewCell = collectionView.dequeueCell(indexPath)
        if controller == "Meats"{
            cell.setValues(self.meats[indexPath.item])
        }else{
            cell.setValues(self.groceries[indexPath.item])
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        if controller == "Meats"{
            self.meats.forEach {
                $0.isSelected = false
            }
            self.meats[indexPath.item].isSelected = true
            collectionView.reloadData()
        }else{
            self.groceries.forEach {
                $0.isSelected = false
            }
            self.groceries[indexPath.item].isSelected = true
            collectionView.reloadData()
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = collectionView.bounds.size
        size.width -= 30
        size.width /= 5
        return size
    }
}
