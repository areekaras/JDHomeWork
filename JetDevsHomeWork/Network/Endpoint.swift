//
//  Endpoint.swift
//  JetDevsHomeWork
//
//  Created by Shibili Areekara on 12/12/22.
//

import Foundation

protocol Endpoint {
    
    var base: String { get }
    var path: String { get }
    var headers: [String: String]? { get }
    var params: [String: Any]? { get }
    var parameterEncoding: ParameterEnconding { get }
    var method: HTTPMethod { get }
}

extension Endpoint {
    
    var urlComponents: URLComponents {
        guard var components = URLComponents(string: base) else {
            fatalError("Invalid base URL")
        }
        
        components.path = path
        var queryItems: [URLQueryItem] = []
        
        switch parameterEncoding {
        case .defaultEncoding:
            if let params = params, method == .get {
                queryItems.append(contentsOf: params.map {
                    return URLQueryItem(name: "\($0)", value: "\($1)")
                })
            }
        case .compositeEncoding:
            if let params = params,
               let queryParams = params["query"] as? [String: Any] {
                queryItems.append(contentsOf: queryParams.map {
                    return URLQueryItem(name: "\($0)", value: "\($1)")
                })
            }
        case .jsonEncoding:
            break
        }
        
        components.queryItems = queryItems
        return components
    }
    
    var request: URLRequest {
        guard let url = urlComponents.url else {
            fatalError("Invalid URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        if let headers = headers {
            for (key, value) in headers {
                request.setHeader(for: key, with: value)
            }
        }
        
        guard let params = params, method != .get
        else {
            return request
        }
        
        switch parameterEncoding {
        case .defaultEncoding:
            request.httpBody = params.percentEscaped().data(using: .utf8)
        case .jsonEncoding:
            request.setJSONContentType()
            let jsonData = try? JSONSerialization.data(withJSONObject: params)
            request.httpBody = jsonData
        case .compositeEncoding:
            if let bodyParams = params["body"] as? [String: Any] {
                request.setJSONContentType()
                let jsonData = try? JSONSerialization.data(withJSONObject: bodyParams)
                request.httpBody = jsonData
            }
        }
        
        return request
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
    case patch = "PATCH"
}

enum ParameterEnconding {
    case defaultEncoding
    case jsonEncoding
    case compositeEncoding
}
