//
//  Networking.swift
//  JetDevsHomeWork
//
//  Created by Shibili Areekara on 12/12/22.
//

import Foundation

protocol Networking {
    
  typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>
    
  func request(from: Endpoint, completion: @escaping (Result) -> Void)
}
