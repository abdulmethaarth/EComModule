//
//  FoodShopTableViewCell.swift
//  E-Com
//
//  Created by Admin on 28/07/22.
//

import UIKit

class FoodShopTableViewCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var shopName: UILabel!
    @IBOutlet weak var rateDtls: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setValues(_ deals: FoodShopItem) {
        self.shopName?.text = deals.title
        self.rateDtls?.text = deals.rateDtls
        self.descriptionLbl?.text = deals.description
        self.img?.image = deals.image
        self.img?.layer.cornerRadius = 20
       
    }

}
