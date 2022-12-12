//
//  URLRequest+Extensions.swift
//  JetDevsHomeWork
//
//  Created by Shibili Areekara on 12/12/22.
//

import Foundation

extension URLRequest {
    
    mutating func setJSONContentType() {
        setValue("application/json; charset=utf-8",
                 forHTTPHeaderField: "Content-Type")
    }
    mutating func setHeader(for httpHeaderField: String, with value: String) {
        setValue(value, forHTTPHeaderField: httpHeaderField)
    }
}
