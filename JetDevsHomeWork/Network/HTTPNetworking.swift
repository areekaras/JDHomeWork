//
//  HTTPNetworking.swift
//  JetDevsHomeWork
//
//  Created by Shibili Areekara on 12/12/22.
//

import Foundation

struct HTTPNetworking: Networking {
    
    private struct UnexpectedValuesRepresentation: Error {}
    
    func request(from: Endpoint, completion: @escaping (Networking.Result) -> Void) {
        
        let request = from.request
        
//        Debug.log("\n\nURL - \(request.url?.absoluteString ?? "")\n")
//        Debug.log("Body - \(request.httpBody?.toString() ?? "")")
//        Debug.log("Headers - \(request.allHTTPHeaderFields)")
        
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func createDataTask(from request: URLRequest,
                                completion: @escaping (Networking.Result) -> Void) -> URLSessionDataTask {
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            completion(Result {
                if let error = error {
                    throw error
                } else if let data = data, let response = response as? HTTPURLResponse {
                    return (data, response)
                } else {
                    throw UnexpectedValuesRepresentation()
                }
            })
        }
        
        return task
    }
}
