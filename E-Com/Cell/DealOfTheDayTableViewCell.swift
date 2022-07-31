//
//  DealOfTheDayTableViewCell.swift
//  E-Com
//
//  Created by Admin on 27/07/22.
//

import UIKit

class DealItem {
    var title: String!
    var image: UIImage!
    var isSelected: Bool! = false
    
    init(title: String!, image: UIImage!, isSelected: Bool = false) {
        self.title = title
        self.image = image
        self.isSelected = isSelected
    }
}

class DealOfTheDayTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var deals = [
        DealItem(title: "Food", image: #imageLiteral(resourceName: "soup").withRenderingMode(.alwaysOriginal)),
        DealItem(title: "Juice", image: #imageLiteral(resourceName: "orange-juice").withRenderingMode(.alwaysOriginal)),
        DealItem(title: "Meat", image: #imageLiteral(resourceName: "chicken-leg").withRenderingMode(.alwaysOriginal)),
        DealItem(title: "Grocery", image: #imageLiteral(resourceName: "grocery-2").withRenderingMode(.alwaysOriginal))
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

extension DealOfTheDayTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return deals.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: DealOfTheDayCollectionViewCell = collectionView.dequeueCell(indexPath)
        cell.setValues(self.deals[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.deals.forEach {
            $0.isSelected = false
        }
        self.deals[indexPath.item].isSelected = true
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = collectionView.bounds.size
        size.width -= 20
        size.width /= 3
        return size
    }
}
