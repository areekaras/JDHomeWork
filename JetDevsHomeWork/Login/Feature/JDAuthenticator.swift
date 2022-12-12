//
//  JDAuthenticator.swift
//  JetDevsHomeWork
//
//  Created by Shibili Areekara on 12/12/22.
//

import Foundation

struct JDAuthenticatorParams {
    let email: String
    let password: String
}

protocol JDAuthenticator {
    
    typealias Result = Swift.Result<JDLoginData, Error>
      
    func login(params: JDAuthenticatorParams, completion: @escaping (Result) -> Void)
}
