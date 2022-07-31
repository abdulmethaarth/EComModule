//
//  HomeViewController.swift
//  E-Com
//
//  Created by Admin on 27/07/22.
//

import UIKit

class FoodShopItem {
    var title: String!
    var rateDtls: String!
    var description: String!
    var image: UIImage!
    var isSelected: Bool! = false
    
    init(title: String!,rateDtls: String!,description: String!, image: UIImage!, isSelected: Bool = false) {
        self.title = title
        self.rateDtls = rateDtls
        self.description = description
        self.image = image
        self.isSelected = isSelected
    }
}

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var shops = [
        FoodShopItem(title: "Krishna's idly kadai",rateDtls: "15mins. ₹80",description: "Saivam,Attur,Salem", image: #imageLiteral(resourceName: "istockphoto-1087685240-170667a").withRenderingMode(.alwaysOriginal)),
        
        FoodShopItem(title: "Abdul biryani shop",rateDtls: "30mins. ₹150",description: "Ulavar santhai opposite,Attur,Salem", image: #imageLiteral(resourceName: "istockphoto-488481490-170667a").withRenderingMode(.alwaysOriginal)),
        FoodShopItem(title: "Ambur biryani",rateDtls: "20mins. ₹140",description: "Pudupet,Attur,Salem", image: #imageLiteral(resourceName: "istockphoto-1305452646-170667a").withRenderingMode(.alwaysOriginal)),
        FoodShopItem(title: "Hotel Hari vilas",rateDtls: "34mins. ₹100",description: "Ranipet,Attur,Salem", image: #imageLiteral(resourceName: "360_F_200168352_x1D7lfXo6UPHHN2rm72A6whk35SXGeB3").withRenderingMode(.alwaysOriginal)),
        FoodShopItem(title: "Mangal Hotel",rateDtls: "25mins. ₹120",description: "Gandhi nagar,Attur,Salem", image: #imageLiteral(resourceName: "cuisine-food-india-indian-wallpaper-preview").withRenderingMode(.alwaysOriginal)),
        FoodShopItem(title: "Ganapathi Saivam",rateDtls: "34mins. ₹110",description: "Saivam,Attur,Salem", image: #imageLiteral(resourceName: "indian-food-dosai-idly-indian-wallpaper-preview").withRenderingMode(.alwaysOriginal))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cellType = HomeTableViewCellType(rawValue: section)!
        switch cellType {
        case .grocery, .meats:
            return 2
        case .foodShop:
            return shops.count
        default:
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return HomeTableViewCellType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let cellType = HomeTableViewCellType(rawValue: section)!
        switch cellType {
        case .banner:
            return 0
        default:
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cellType = HomeTableViewCellType(rawValue: section)!
        switch cellType {
        case .banner, .foodShop:
            return nil
        default:
            let cell: HeaderTableViewCell = tableView.dequeueCell()
            cell.headerName?.text = cellType.title
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = HomeTableViewCellType(rawValue: indexPath.section)!
        switch cellType {
        case .category:
            let cell: CategoryTableViewCell = tableView.dequeueCell(indexPath)
            return cell
        case .banner:
            let cell: BannerTableViewCell = tableView.dequeueCell(indexPath)
            return cell
        case .popular:
            let cell: PopularFoodsTableViewCell = tableView.dequeueCell(indexPath)
            return cell
        case .grocery:
            if indexPath.row == 0 {
                let cell: BannerTableViewCell = tableView.dequeueCell(indexPath)
                cell.controller = "Grocery"
                return cell
            } else {
                let cell: GroceryTableViewCell = tableView.dequeueCell(indexPath)
                return cell
            }
        case .meats:
            if indexPath.row == 0 {
                let cell: BannerTableViewCell = tableView.dequeueCell(indexPath)
                cell.controller = "Meats"
                return cell
            } else {
                let cell: GroceryTableViewCell = tableView.dequeueCell(indexPath)
                cell.controller = "Meats"
                return cell
            }
        case .coupons:
            let cell: CouponsTableViewCell = tableView.dequeueCell(indexPath)
            return cell
        case .deal:
            let cell: DealOfTheDayTableViewCell = tableView.dequeueCell(indexPath)
            return cell
        case .foodShop:
            let cell: FoodShopTableViewCell = tableView.dequeueCell(indexPath)
            cell.setValues(self.shops[indexPath.row])
            return cell
        }
    }
}

extension UITableView {
    func dequeueCell<T: NSObject>(_ indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: T.className, for: indexPath) as! T
    }
    
    func dequeueCell<T: NSObject>() -> T {
        return self.dequeueReusableCell(withIdentifier: T.className) as! T
    }
}

extension UICollectionView {
    func dequeueCell<T: NSObject>(_ indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: T.className, for: indexPath) as! T
    }
}

extension NSObject {
    class var className: String {
        return String(describing: self)
    }
    
    var classNameString: String {
        return String(describing: self)
    }
}

enum HomeTableViewCellType: Int, CaseIterable {
    case category = 0
    case banner
    case popular
    case grocery
    case coupons
    case meats
    case deal
    case foodShop
    
    var title: String? {
        switch self {
        case .category:
            return "Category"
        case .banner, .foodShop:
            return nil
        case .popular:
            return "Popular"
        case .grocery:
            return "Grocery"
        case .coupons:
            return "Coupons"
        case .meats:
            return "Meats"
        case .deal:
            return "Deal of the day"
        }
    }
}
