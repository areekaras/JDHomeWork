//
//  RemoteJDAuthenticator.swift
//  JetDevsHomeWork
//
//  Created by Shibili Areekara on 12/12/22.
//

import Foundation

final class RemoteJDAuthenticator: JDAuthenticator {
    
    private let networking: Networking
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    typealias Result = JDAuthenticator.Result
    
    init(networking: Networking) {
        self.networking = networking
    }
    
    func login(params: JDAuthenticatorParams, completion: @escaping (Result) -> Void) {
        networking.request(from: RemoteJDAuthenticate.login(params: params)) { [weak self] result in
            guard self != nil
            else {
                return
            }
            
            switch result {
            case let .success((data, response)):
                completion(RemoteJDAuthenticator.map(data, from: response))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    private static func map(_ data: Data, from response: HTTPURLResponse) -> Result {
        do {
            let dataModel = try RemoteJDLoginDataMapper.map(data, from: response)
            let featureModel = try dataModel.toModel()
            return .success(featureModel)
        } catch {
            return .failure(error)
        }
    }
}

private extension RemoteJDLoginData {
    
    func toModel() throws -> JDLoginData {
        guard error_message.isEmpty,
              let user = data?.user
        else {
            throw NSError(domain: "API Error", code: 401, userInfo: [
                NSLocalizedDescriptionKey: error_message
            ])
        }
        
        return JDLoginData(user: user.toModel(),
                           error: "")
    }
}

private extension RemoteJDLoginDataUser {
    
    func toModel() -> JDUser {
        return JDUser(id: user_id,
                      name: user_name,
                      profileURL: user_profile_url,
                      createdAt: created_at)
    }
}
