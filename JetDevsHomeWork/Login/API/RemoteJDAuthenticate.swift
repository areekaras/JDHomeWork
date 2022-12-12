//
//  RemoteJDAuthenticate.swift
//  JetDevsHomeWork
//
//  Created by Shibili Areekara on 12/12/22.
//


enum RemoteJDAuthenticate {
    
    case login(params: JDAuthenticatorParams)
}

extension RemoteJDAuthenticate: Endpoint {
    
    var base: String {
        return "https://jetdevs.mocklab.io"
    }
    
    var path: String {
        switch self {
        case .login:
            return "/login"
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .login:
            return nil
        }
    }
    
    var params: [String : Any]? {
        switch self {
        case let .login(params):
            return getLoginParams(from: params)
        }
    }
    
    var parameterEncoding: ParameterEnconding {
        switch self {
        case .login:
            return .jsonEncoding
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        }
    }
    
    private func getLoginParams(from params: JDAuthenticatorParams) {
        return ["email": params.email, "password": params.password]
    }
}
