//
//  ViewController.swift
//  E-Com
//
//  Created by Admin on 27/07/22.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import MaterialComponents.MaterialTextControls_OutlinedTextFieldsTheming

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTxtField: MDCOutlinedTextField!
    @IBOutlet weak var passwordTxtField: MDCOutlinedTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTxtField.label.text = "Email"
        emailTxtField.setFloatingLabelColor(.white, for: .normal)
        emailTxtField.setOutlineColor(.white, for: .normal)
        emailTxtField.setOutlineColor(.white, for: .editing)
        emailTxtField.setTextColor(.white, for: .editing)
        emailTxtField.setFloatingLabelColor(.white, for: .editing)
        emailTxtField.setNormalLabelColor(.white, for: .normal)
        emailTxtField.setNormalLabelColor(.white, for: .editing)
        emailTxtField.tintColor = .white
        emailTxtField.placeholder = "example@gmail.com"
        
        passwordTxtField.label.text = "Password"
        passwordTxtField.placeholder = "* * * * *"
        passwordTxtField.setTextColor(.white, for: .editing)
        passwordTxtField.setFloatingLabelColor(.white, for: .normal)
        passwordTxtField.setOutlineColor(.white, for: .normal)
        passwordTxtField.setOutlineColor(.white, for: .editing)
        passwordTxtField.setFloatingLabelColor(.white, for: .editing)
        passwordTxtField.setNormalLabelColor(.white, for: .normal)
        passwordTxtField.setNormalLabelColor(.white, for: .editing)
        passwordTxtField.tintColor = .white
        
    }
    
    
    @IBAction func proceedBtnAction(_ sender: Any){
        if emailTxtField.text == "" {
            AppUtils().simpleAlert(view: self, title: "Alert", message: "Please provide valid Email")
        }else if passwordTxtField.text == "" {
            AppUtils().simpleAlert(view: self, title: "Alert", message: "Please provide Password")
        }else {
            
            let tabVC = mainStoryBoard?.instantiateViewController(withIdentifier: "BottomTabBarController") as! BottomTabBarController
            (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController = UINavigationController(rootViewController: tabVC)
            
        }
    }
    @IBAction func continueMobileBtnAction(_ sender: Any){
        let mobileVC = mainStoryBoard?.instantiateViewController(withIdentifier: "MobileLoginViewController") as! MobileLoginViewController
        navigationController?.pushViewController(mobileVC, animated: true)
    }
    
}

