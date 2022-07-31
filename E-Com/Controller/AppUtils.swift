//
//  AppUtils.swift
//  E-Com
//
//  Created by Admin on 27/07/22.
//

import Foundation
import UIKit

class AppUtils: NSObject{
    public func simpleAlert(view:UIViewController, title:String, message:String)
    {
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:
            { action in
                
                print("Alert")
            }))
            view.present(alert, animated: true, completion: nil)
        }
}
