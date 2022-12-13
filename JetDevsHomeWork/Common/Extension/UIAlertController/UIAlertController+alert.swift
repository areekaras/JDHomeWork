//
//  UIAlertController+alert.swift
//  JetDevsHomeWork
//
//  Created by Shibili Areekara on 13/12/22.
//

import UIKit

extension UIAlertController {
    
    class func alert(title: String = "", message: String = "", acceptMessage: String = "OK", acceptBlock: @escaping () -> Void = { }) {
        
        DispatchQueue.main.async {
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            
            let acceptButton = UIAlertAction(title: acceptMessage, style: .default, handler: { _ in
                acceptBlock()
            })
            
            alert.addAction(acceptButton)
            if (UIApplication.shared.keyWindow?.rootViewController?.presentedViewController as? UIAlertController) != nil {
                return
            }
            
            topMostController()?.present(alert, animated: true)
        }
    }
    
    fileprivate class func topMostController() -> UIViewController? {
        
        var presentedVC = UIApplication.shared.keyWindow?.rootViewController
        while let pVC = presentedVC?.presentedViewController {
            presentedVC = pVC
        }
        
        return presentedVC
    }
}
