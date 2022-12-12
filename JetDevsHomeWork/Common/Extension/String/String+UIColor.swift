//
//  String+UIColor.swift
//  JetDevsHomeWork
//
//  Created by Shibili Areekara on 12/12/22.
//

import UIKit

extension String {
    
    func hexStringToUIColor(alpha: Float = 1.0) -> UIColor {
      var cString: String = self.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
      if cString.hasPrefix("#") {
        cString.remove(at: cString.startIndex)
      }
        
      if ((cString.count) != 6) {
        return UIColor.gray
      }
        
      var rgbValue: UInt32 = 0
      Scanner(string: cString).scanHexInt32(&rgbValue)
        
      return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(alpha)
      )
        
    }
}
