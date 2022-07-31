//
//  CouponsTableViewCell.swift
//  E-Com
//
//  Created by Admin on 28/07/22.
//

import UIKit

class CouponItem {
    var image: UIImage!
    init(image: UIImage!) {
        self.image = image
    }
}

class CouponsTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var coupons = [
        CouponItem(image: #imageLiteral(resourceName: "discount-1").withRenderingMode(.alwaysOriginal)),
        CouponItem(image: #imageLiteral(resourceName: "coupon").withRenderingMode(.alwaysOriginal)),
        CouponItem(image: #imageLiteral(resourceName: "coupon2").withRenderingMode(.alwaysOriginal)),
        CouponItem(image: #imageLiteral(resourceName: "coupon3").withRenderingMode(.alwaysOriginal))
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
extension CouponsTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coupons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CouponsCollectionViewCell = collectionView.dequeueCell(indexPath)
        cell.setValues(self.coupons[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var size = collectionView.bounds.size
        size.width -= 20
        size.width /= 2.5
        return size
    }
}

