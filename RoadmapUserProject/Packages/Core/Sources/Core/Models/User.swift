//
//  User.swift
//  Core
//
//  Created by Prank on 17/9/25.
//

import Foundation

public struct User: Codable, Identifiable {
    public let id: String
    public let email: String
    public let name: String
    public let avatarURL: String?
    
    public init(id: String, email: String, name: String, avatarURL: String? = nil) {
        self.id = id
        self.email = email
        self.name = name
        self.avatarURL = avatarURL
    }
}
