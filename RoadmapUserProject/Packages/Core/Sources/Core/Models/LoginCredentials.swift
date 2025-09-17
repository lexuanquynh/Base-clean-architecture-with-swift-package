//
//  LoginCredentials.swift
//  Core
//
//  Created by Prank on 17/9/25.
//

import Foundation

public struct LoginCredentials {
    public let email: String
    public let password: String
    
    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
