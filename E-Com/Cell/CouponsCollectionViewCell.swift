//
//  CouponsCollectionViewCell.swift
//  E-Com
//
//  Created by Admin on 28/07/22.
//

import UIKit

class CouponsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var couponImg: UIImageView!
    
    func setValues(_ coupon: CouponItem) {
        self.couponImg?.image = coupon.image
    }
    
}
