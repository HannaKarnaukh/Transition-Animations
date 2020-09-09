//
//  ErrorObject.swift
//  Transition-Animations
//
//  Created by Hanna Karnaukh on 09.09.2020.
//  Copyright © 2020 hkarn. All rights reserved.
//

import Foundation

final class ErrorObject: Error {
    
    var error: String
    var statusCode: Int?
    
    init(error: Data, statusCode: Int?) {
        self.statusCode = statusCode
        self.error = (try? JSONDecoder().decode(String.self, from: error)) ?? "Decoding error failure"
    }
    
    init(error: String) {
        self.error = error
    }
}

extension ErrorObject: LocalizedError {
    
    public var errorDescription: String? {
        return NSLocalizedString(error, comment: "")
    }
}

