//
//  GetInfoService.swift
//  Transition-Animations
//
//  Created by Hanna Karnaukh on 09.09.2020.
//  Copyright © 2020 hkarn. All rights reserved.
//

import Foundation

protocol GetInfoServiceProtocol {
    
    init(apiClient: APIClientProtocol)
    
    func getInfo(handler: @escaping ([InfoObject]?, Error?) -> Void)
}


class GetInfoService: GetInfoServiceProtocol {
    
    let apiClient: APIClientProtocol
    
    required init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    func getInfo(handler: @escaping ([InfoObject]?, Error?) -> Void) {
        let request = GetInfoRequest()
        apiClient.request(request) { (result: Result<Response<[InfoObject]>, Error>) in
            switch result {
            case .success(let response):
                handler(response.data, nil)
            case .failure(let error):
                handler(nil, error)
            }
        }
    }
}

class InfoObject: Codable {
        
    let classes: [String]
    let sets: [String]
    let standard: [String]
    let wild: [String]
    let types: [String]
    let factions: [String]
    let qualities: [String]
    let races: [String]
    let locales: [String]
}
