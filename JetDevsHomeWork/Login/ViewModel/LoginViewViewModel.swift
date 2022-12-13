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
        
        authenticator.login(params: params) { [weak self] result in
            guard let self = self else {
                return
            }
            
            switch result {
            case let .success(user):
                self.saveUserData(user: user)
                completion(nil)
            case let .failure(error):
                completion(error)
            }
        }
    }
    
    func saveUserData(user: JDUser){
        let localUser = user.toLocalModel()
        
        let encoder = JSONEncoder()
        let data = try? encoder.encode(localUser)
        
        UserDefaults.standard.set(data, forKey: "user")
    }
}

private extension JDUser {
    
    func toLocalModel() -> JDLocalUser {
        return JDLocalUser(userID: userID,
                           name: name,
                           profileURL: profileURL,
                           createdAt: createdAt)
    }
}
