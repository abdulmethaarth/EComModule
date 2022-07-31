//
//  BottomTabBarController.swift
//  E-Com
//
//  Created by Admin on 27/07/22.
//

import UIKit

class BottomTabBarController: UITabBarController {

  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

}
