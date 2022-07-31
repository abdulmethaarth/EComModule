//
//  SplashViewController.swift
//  E-Com
//
//  Created by Admin on 27/07/22.
//

import UIKit

class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
    }
    var timer: Timer?
    
    func startTimer() {
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: { [weak self](timerr) in
            self?.stopTimer()
            DispatchQueue.main.async { [weak self] in
                self?.controlFlow()
            }
        })
    }
    
    func stopTimer() {
        self.timer?.invalidate()
        self.timer = nil
        
    }
    
    func controlFlow() {
        let loginVC = mainStoryBoard?.instantiateViewController(withIdentifier: "MobileLoginViewController") as! MobileLoginViewController
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
}

extension UIViewController{
    var mainStoryBoard: UIStoryboard?{
        return UIStoryboard(name: "Main", bundle: nil)
    }
}
