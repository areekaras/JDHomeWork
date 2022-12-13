//
//  String+Date.swift
//  JetDevsHomeWork
//
//  Created by Shibili Areekara on 13/12/22.
//

import Foundation

extension String {
    
    func toDate(format: String = "yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSS'Z'") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = .current
        dateFormatter.dateFormat = format
        
        return dateFormatter.date(from: self)
    }
}
