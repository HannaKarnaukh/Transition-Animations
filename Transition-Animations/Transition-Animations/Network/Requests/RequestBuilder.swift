//
//  RequestBuilder.swift
//  Transition-Animations
//
//  Created by Hanna Karnaukh on 09.09.2020.
//  Copyright © 2020 hkarn. All rights reserved.
//

import Alamofire

class RequestBuilder {
    
    static func buildURLRequest(_ requestProtocol: RequestProtocol, withURLString URLString: String) -> URLRequest {
        
        let baseUrlString = "\(URLString)/\(requestProtocol.path)"
        NSLog(baseUrlString)
        
        guard let baseUrl = URL(string: baseUrlString) else {
            fatalError("Bad URLString: \(URLString)")
        }
        
        var components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: true)!
        var customQueryItems: [URLQueryItem] = []
        
        if let parameters = requestProtocol.paramethers() {
            customQueryItems = parameters.map { URLQueryItem(name: $0.key, value: String($0.value))}
        }
        
        components.queryItems = customQueryItems
        
        var request: URLRequest = URLRequest(url: components.url!)
        request.httpMethod = requestProtocol.method
        
        if let httpHeaders = requestProtocol.httpHeaders() {
            request.headers = HTTPHeaders(httpHeaders)
        }
        
        request.addValue("x-rapidapi-host", forHTTPHeaderField: "omgvamp-hearthstone-v1.p.rapidapi.com")
        request.addValue("x-rapidapi-key", forHTTPHeaderField: "66ee3dfb78msh8cfc0ef7eec8380p18983ejsn9c1336393da0")
        return request
    }
}
