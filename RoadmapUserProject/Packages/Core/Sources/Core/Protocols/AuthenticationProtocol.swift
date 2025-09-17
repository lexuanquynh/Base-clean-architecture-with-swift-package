//
//  AuthenticationProtocol.swift
//  Core
//
//  Created by Prank on 17/9/25.
//

import Foundation
import Combine

public protocol AuthenticationProtocol {
    func login(credentials: LoginCredentials) async throws -> User
    func logout() async throws
    func getCurrentUser() -> User?
}
