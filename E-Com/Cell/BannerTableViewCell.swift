//
//  BannerTableViewCell.swift
//  E-Com
//
//  Created by Admin on 27/07/22.
//

import UIKit

class BannerItem {
    var image: UIImage!
    init(image: UIImage!) {
        self.image = image
    }
}

class BannerTableViewCell: UITableViewCell {
    
    var controller: String!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var banners = [
        BannerItem(image: #imageLiteral(resourceName: "banner3").withRenderingMode(.alwaysOriginal)),
        BannerItem(image: #imageLiteral(resourceName: "banner1").withRenderingMode(.alwaysOriginal)),
        BannerItem(image: #imageLiteral(resourceName: "banner5").withRenderingMode(.alwaysOriginal)),
        BannerItem(image: #imageLiteral(resourceName: "banner2").withRenderingMode(.alwaysOriginal)),
        BannerItem(image: #imageLiteral(resourceName: "banner4.jpg").withRenderingMode(.alwaysOriginal))
    ]
    var groceryBanners = [
        BannerItem(image: #imageLiteral(resourceName: "grocery_banner1").withRenderingMode(.alwaysOriginal)),
        BannerItem(image: #imageLiteral(resourceName: "banner4.jpg").withRenderingMode(.alwaysOriginal)),
        BannerItem(image: #imageLiteral(resourceName: "grocery_banner3").withRenderingMode(.alwaysOriginal))
    ]
    
    var meatsBanners = [
        BannerItem(image: #imageLiteral(resourceName: "TKK+New+Spicy+Items_website+banner+(Custom)").withRenderingMode(.alwaysOriginal)),
        BannerItem(image: #imageLiteral(resourceName: "fried-chicken-promotion-restaurant-facebook-cover-banner-template_224141-40").withRenderingMode(.alwaysOriginal)),
        BannerItem(image: #imageLiteral(resourceName: "horizontal-banner-template-fried-chicken-restaurant_23-2148717466").withRenderingMode(.alwaysOriginal))
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

extension BannerTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if controller == "Grocery"{
            return groceryBanners.count
        }else if controller == "Meats"{
            return meatsBanners.count
        }else {
            return banners.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BannerCollectionViewCell = collectionView.dequeueCell(indexPath)
        if controller == "Grocery"{
            cell.setValues(self.groceryBanners[indexPath.item])
        }else if controller == "Meats"{
            cell.setValues(self.meatsBanners[indexPath.item])
        }else {
            cell.setValues(self.banners[indexPath.item])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}
