//
//  UIActivityIndicator.swift
//  JetDevsHomeWork
//
//  Created by Shibili Areekara on 13/12/22.
//

import UIKit

extension UIActivityIndicatorView {
    
    static func activityIndicator(frame: CGRect? = nil,
                                  center: CGPoint? = nil) -> UIActivityIndicatorView {
       
        let activityIndicatorView = UIActivityIndicatorView()

        if let frame = frame {
            activityIndicatorView.frame = frame
        }
        
        if let center = center {
            activityIndicatorView.center = center
        }
        
        return activityIndicatorView
    }
}
