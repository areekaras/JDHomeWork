//
//  RemoteJDLoginDataMapper.swift
//  JetDevsHomeWork
//
//  Created by Shibili Areekara on 12/12/22.
//

import Foundation

final class RemoteJDLoginDataMapper {
    
    static func map(_ data: Data, from response: HTTPURLResponse) throws -> RemoteJDLoginData {
        
        guard response.isOK else {
            throw RemoteJDAuthenticator.Error.invalidData
        }
        
//        Debug.log("\n\n**** Response code: \(response.statusCode)\n")
//        Debug.log("\n**** Response data: \(data.toString())\n\n")
        
        do {
          let model = try JSONDecoder().decode(RemoteJDLoginData.self, from: data)
            return model
        } catch {
            throw error
        }
    }
    
}
