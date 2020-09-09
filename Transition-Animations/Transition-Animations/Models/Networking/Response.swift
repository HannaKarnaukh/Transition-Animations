//
//  Response.swift
//  Transition-Animations
//
//  Created by Hanna Karnaukh on 09.09.2020.
//  Copyright © 2020 hkarn. All rights reserved.
//

import Foundation

class Response<T: Decodable> {
    let data: T?
    let statusCode: Int
    
    init(data: T, statusCode: Int?) {
        self.data = data
        self.statusCode = statusCode ?? 0
    }
}
