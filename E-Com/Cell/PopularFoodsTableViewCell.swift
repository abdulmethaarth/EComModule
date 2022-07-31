//
//  PopularFoodsTableViewCell.swift
//  E-Com
//
//  Created by Admin on 27/07/22.
//

import UIKit

class PopularFoodItem {
    var image: UIImage!
    init(image: UIImage!) {
        self.image = image
    }
}


class PopularFoodsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!

    
    var popularFood = [
        PopularFoodItem(image: #imageLiteral(resourceName: "popular_food1").withRenderingMode(.alwaysOriginal)),
        PopularFoodItem(image: #imageLiteral(resourceName: "briyani").withRenderingMode(.alwaysOriginal)),
        PopularFoodItem(image: #imageLiteral(resourceName: "sea_food").withRenderingMode(.alwaysOriginal))
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

extension PopularFoodsTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return popularFood.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PopularFoodsCollectionViewCell = collectionView.dequeueCell(indexPath)
        cell.setValues(self.popularFood[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = collectionView.bounds.size
        size.width -= 20
        size.width /= 2
        return size
    }
}

