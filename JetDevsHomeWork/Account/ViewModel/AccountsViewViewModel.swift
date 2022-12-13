//
//  AccountsViewViewModel.swift
//  JetDevsHomeWork
//
//  Created by Shibili Areekara on 13/12/22.
//

import Foundation

class AccountsViewViewModel {
    
    func loadUser(completion: @escaping (JDLocalUser?) -> Void) {
        if let data = UserDefaults.standard.data(forKey: "user") {
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(JDLocalUser.self, from: data)
                
                completion(user)
            } catch {
                completion(nil)
            }
        } else {
            completion(nil)
        }
    }
}
