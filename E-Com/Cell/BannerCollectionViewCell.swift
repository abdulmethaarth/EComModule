//
//  BannerCollectionViewCell.swift
//  E-Com
//
//  Created by Admin on 27/07/22.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var bannerImg: UIImageView!
    
    func setValues(_ banner: BannerItem) {
        self.bannerImg?.image = banner.image
    }
    
}
