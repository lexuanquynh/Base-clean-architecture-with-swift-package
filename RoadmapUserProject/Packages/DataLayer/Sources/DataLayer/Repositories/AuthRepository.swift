//
//  AuthRepository.swift
//  DataLayer
//
//  Created by Prank on 17/9/25.
//

import Foundation
import Core
import Combine

public class AuthRepository: AuthenticationProtocol {
    @Published public private(set) var currentUser: User?
    
    public init() {}
    
    public func login(credentials: LoginCredentials) async throws -> User {
        // Simulate API call
        try await Task.sleep(nanoseconds: 2_000_000_000) // 2 seconds
        
        // Mock validation
        if credentials.email == "test@example.com" && credentials.password == "password123" {
            let user = User(
                id: UUID().uuidString,
                email: credentials.email,
                name: "John Doe",
                avatarURL: nil
            )
            currentUser = user
            return user
        } else {
            throw AuthError.invalidCredentials
        }
    }
    
    public func logout() async throws {
        currentUser = nil
    }
    
    public func getCurrentUser() -> User? {
        return currentUser
    }
}

extension AuthRepository: @unchecked Sendable {}

public enum AuthError: LocalizedError {
    case invalidCredentials
    case networkError
    
    public var errorDescription: String? {
        switch self {
        case .invalidCredentials:
            return "Invalid email or password"
        case .networkError:
            return "Network error occurred"
        }
    }
}
