//
//  ContentView.swift
//  RoadmapUserProject
//
//  Created by Prank on 17/9/25.
//

import SwiftUI
import Login
import Home
import Core
import DataLayer

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        Group {
            if appState.isAuthenticated, let user = appState.currentUser {
                HomeView(user: user) {
                    withAnimation {
                        appState.logout()
                    }
                }
                .transition(.move(edge: .trailing))
            } else {
                LoginView(authRepository: appState.authRepository) { user in
                    withAnimation {
                        appState.login(user: user)
                    }
                }
                .transition(.move(edge: .leading))
            }
        }
        .animation(.easeInOut, value: appState.isAuthenticated)
    }
}

#Preview {
    ContentView()
        .environmentObject(AppState())
}
