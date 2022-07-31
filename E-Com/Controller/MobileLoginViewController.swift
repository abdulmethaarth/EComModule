//
//  MobileLoginViewController.swift
//  E-Com
//
//  Created by Admin on 27/07/22.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import MaterialComponents.MaterialTextControls_OutlinedTextFieldsTheming

class MobileLoginViewController: UIViewController {

    @IBOutlet weak var mobileNumberTxtField: MDCOutlinedTextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mobileNumberTxtField.label.text = "Mobile Number"
        mobileNumberTxtField.keyboardType = .numberPad
        mobileNumberTxtField.setTextColor(.white, for: .editing)
        mobileNumberTxtField.setFloatingLabelColor(.white, for: .normal)
        mobileNumberTxtField.setOutlineColor(.white, for: .normal)
        mobileNumberTxtField.setOutlineColor(.white, for: .editing)
        mobileNumberTxtField.setFloatingLabelColor(.white, for: .editing)
        mobileNumberTxtField.setNormalLabelColor(.white, for: .normal)
        mobileNumberTxtField.setNormalLabelColor(.white, for: .editing)
        mobileNumberTxtField.tintColor = .white
        mobileNumberTxtField.placeholder = "+91 7845533782"
        
    }
    
    
    @IBAction func proceedBtnAction(_ sender: Any){
        if mobileNumberTxtField.text == "" {
            AppUtils().simpleAlert(view: self, title: "Alert", message: "Please provide valid Mobile Number")
        }else {
            let tabVC = mainStoryBoard?.instantiateViewController(withIdentifier: "BottomTabBarController") as! BottomTabBarController
            (UIApplication.shared.delegate as? AppDelegate)?.window?.rootViewController = UINavigationController(rootViewController: tabVC)
        }
    }
    @IBAction func continueEmailBtnAction(_ sender: Any){
        let loginVC = mainStoryBoard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        navigationController?.pushViewController(loginVC, animated: true)
    }

}
