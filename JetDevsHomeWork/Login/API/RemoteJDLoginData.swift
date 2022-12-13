//
//  RemoteJDLoginData.swift
//  JetDevsHomeWork
//
//  Created by Shibili Areekara on 12/12/22.
//

// swiftlint:disable identifier_name

struct RemoteJDLoginData: Decodable {
    
    let error_message: String
    let data: RemoteJDLoginDataData?
}

struct RemoteJDLoginDataData: Decodable {
    
    let user: RemoteJDLoginDataUser?
}

struct RemoteJDLoginDataUser: Decodable {
    
    let user_id: Int
    let user_name: String
    let user_profile_url: String
    let created_at: String
}

// swiftlint:enable identifier_name
