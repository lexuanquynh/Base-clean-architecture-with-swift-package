//
//  LoginView.swift
//  Login
//
//  Created by Prank on 17/9/25.
//

import SwiftUI
import Common
import Core
import DataLayer

public struct LoginView: View {
    @StateObject private var viewModel: LoginViewModel
    let onLoginSuccess: (User) -> Void
    
    public init(authRepository: AuthRepository = AuthRepository(),
                onLoginSuccess: @escaping (User) -> Void) {
        self._viewModel = StateObject(wrappedValue: LoginViewModel(authRepository: authRepository))
        self.onLoginSuccess = onLoginSuccess
    }
    
    public var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Logo
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                    .padding(.bottom, 30)
                
                // Title
                Text("Welcome Back")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Sign in to continue")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                // Form
                VStack(spacing: 15) {
                    CustomTextField(
                        placeholder: "Email",
                        text: $viewModel.email
                    )
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    
                    CustomTextField(
                        placeholder: "Password",
                        text: $viewModel.password,
                        isSecure: true
                    )
                    
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .font(.caption)
                            .foregroundColor(.red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding(.top, 20)
                
                // Login Button
                PrimaryButton(
                    title: "Login",
                    isLoading: viewModel.isLoading
                ) {
                    Task {
                        await viewModel.login()
                    }
                }
                .padding(.top, 10)
                
                // Demo credentials
                VStack(spacing: 5) {
                    Text("Demo Credentials:")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text("Email: test@example.com")
                        .font(.caption2)
                        .foregroundColor(.gray)
                    Text("Password: password123")
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .padding()
            .navigationBarHidden(true)
        }
        .onChange(of: viewModel.isLoggedIn) { _, isLoggedIn in
            if isLoggedIn, let user = viewModel.currentUser {
                onLoginSuccess(user)
            }
        }
    }
}
