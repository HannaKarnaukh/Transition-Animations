//
//  APIClient.swift
//  Transition-Animations
//
//  Created by Hanna Karnaukh on 03.09.2020.
//  Copyright © 2020 hkarn. All rights reserved.
//

import Alamofire

protocol APIClientProtocol {
    
    func request<T: Decodable> (_ request: RequestProtocol, completion: @escaping (Result<Response<T>, Error>) -> Void)
}

class APIClient: APIClientProtocol {
    
    let session: Session
    
    required init() {
        session = Session()
    }
    
    func request<T: Decodable> (_ request: RequestProtocol, completion: @escaping (Result<Response<T>, Error>) -> Void) {
        let URLString = "https://omgvamp-hearthstone-v1.p.rapidapi.com"
        let requestURL = RequestBuilder.buildURLRequest(request, withURLString: URLString)
        
        session.request(requestURL).response(completionHandler: { [weak self] response in
            if let error = response.error {
                completion(.failure(error))
            } else if let jsonData = response.data {
                self?.handleData(jsonData, statusCode: response.response?.statusCode, for: request, with: completion)
            }
        })
    }
    
    func handleData<T: Decodable>(_ jsonData: Data, statusCode: Int?, for request: RequestProtocol, with completion: @escaping (Result<Response<T>, Error>) -> Void) {
        
        NSLog(String(data: jsonData, encoding: .utf8)!)
        
        if statusCode == 200 {
            guard let responseObject = try? JSONDecoder().decode(T.self, from: jsonData) else {
                completion(.failure(ErrorObject(error: "Decoding data failure")))
                return
            }
            
            completion(.success(Response(data: responseObject, statusCode: statusCode)))
        } else {
            let failMessageObject = ErrorObject(error: jsonData, statusCode: statusCode)
            completion(.failure(failMessageObject))
        }
    }
}
