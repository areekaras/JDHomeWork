//
//  HTTPURLResponse+StatusCode.swift
//  JetDevsHomeWork
//
//  Created by Shibili Areekara on 12/12/22.
//

import Foundation

extension HTTPURLResponse {
    
    private static var OK200: Int { return 200 }
    
    var isOK: Bool {
        return statusCode == HTTPURLResponse.OK200
    }
}
