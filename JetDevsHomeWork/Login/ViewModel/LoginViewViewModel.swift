//
//  LoginViewViewModel.swift
//  JetDevsHomeWork
//
//  Created by Shibili Areekara on 12/12/22.
//

import Foundation

class LoginViewViewModel {
    
    let authenticator: JDAuthenticator
    
    init(authenticator: JDAuthenticator) {
        self.authenticator = authenticator
    }
    
    func authenticate(completion: @escaping (Error?) -> Void) {
        let params = JDAuthenticatorParams(email: "test@jetdevs.com",
                                           password: "Jetdevs2021")
        
        authenticator.login(params: params) { result in
            switch result {
            case .success:
                completion(nil)
            case let .failure(error):
                completion(error)
            }
        }
    }
}
