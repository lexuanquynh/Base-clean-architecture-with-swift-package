//
//  LoginViewModel.swift
//  Login
//
//  Created by Prank on 17/9/25.
//

import Foundation
import SwiftUI
import Core
import DataLayer
import Combine

@MainActor
public class LoginViewModel: ObservableObject {
    @Published public var email: String = ""
    @Published public var password: String = ""
    @Published public var isLoading: Bool = false
    @Published public var errorMessage: String?
    @Published public var isLoggedIn: Bool = false
    @Published public var currentUser: User? // Add this
    
    private let authRepository: AuthRepository // Keep private
    
    public init(authRepository: AuthRepository = AuthRepository()) {
        self.authRepository = authRepository
        
        // Pre-fill for demo
        self.email = "test@example.com"
        self.password = "password123"
    }
    
    func login() async {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Please enter email and password"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let credentials = LoginCredentials(email: email, password: password)
            let user = try await authRepository.login(credentials: credentials)
            self.currentUser = user // Store user here
            self.isLoggedIn = true
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
