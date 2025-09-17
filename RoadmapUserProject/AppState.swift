//
//  AppState.swift
//  RoadmapUserProject
//
//  Created by Prank on 17/9/25.
//

import SwiftUI
import Combine
import Core
import DataLayer

@MainActor
final class AppState: ObservableObject {
    @Published var currentUser: User?
    @Published var isAuthenticated: Bool = false
    
    let authRepository = AuthRepository()
    
    init() {
        // Check for saved user session if needed
    }
    
    func login(user: User) {
        currentUser = user
        isAuthenticated = true
    }
    
    func logout() {
        Task {
            try? await authRepository.logout()
            await MainActor.run {
                currentUser = nil
                isAuthenticated = false
            }
        }
    }
}
