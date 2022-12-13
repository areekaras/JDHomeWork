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
    
    func getNumberOfDays(from date: String) -> String {
        guard let date = date.toDate() else {
            return "Created 0 days ago"
        }
        
        let daysDiff = abs(date.getDaysDiff(from: Date()))
        
        return "Created \(daysDiff) days ago"
    }
}
