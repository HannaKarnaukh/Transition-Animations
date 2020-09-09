//
//  GetInfoRequest.swift
//  Transition-Animations
//
//  Created by Hanna Karnaukh on 09.09.2020.
//  Copyright © 2020 hkarn. All rights reserved.
//

import Foundation

class GetInfoRequest: RequestProtocol {
    
    var path: String {
        return "info"
    }
    
    var method: String {
        return HTTPMethods.get
    }
    
    func paramethers() -> [String : String]? {
        return nil
    }
    
    func httpHeaders() -> [String : String]? {
        return nil
    }
}
