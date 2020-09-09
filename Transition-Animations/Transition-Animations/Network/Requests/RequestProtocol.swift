//
//  RequestProtocol.swift
//  Transition-Animations
//
//  Created by Hanna Karnaukh on 09.09.2020.
//  Copyright © 2020 hkarn. All rights reserved.
//

import Foundation

struct HTTPMethods {
    public static let get = "GET"
    public static let post = "POST"
}

protocol RequestProtocol {
    
    var path: String { get }
    var method: String { get }
    
    func paramethers() -> [String: String]?
    func httpHeaders() -> [String: String]?
}
