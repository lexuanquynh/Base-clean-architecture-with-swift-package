//
//  HomeView.swift
//  Home
//
//  Created by Prank on 17/9/25.
//

import SwiftUI
import Core
import Common
import DataLayer

public struct HomeView: View {
    let user: User
    let onLogout: () -> Void
    
    public init(user: User, onLogout: @escaping () -> Void) {
        self.user = user
        self.onLogout = onLogout
    }
    
    public var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Profile Section
                VStack(spacing: 10) {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.blue)
                    
                    Text("Welcome, \(user.name)")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user.email)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(15)
                
                // Menu Items
                VStack(spacing: 15) {
                    MenuItemView(icon: "person", title: "Profile")
                    MenuItemView(icon: "gearshape", title: "Settings")
                    MenuItemView(icon: "bell", title: "Notifications")
                    MenuItemView(icon: "questionmark.circle", title: "Help")
                }
                .padding(.top, 20)
                
                Spacer()
                
                // Logout Button
                Button(action: onLogout) {
                    HStack {
                        Image(systemName: "arrow.right.square")
                        Text("Logout")
                    }
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red.opacity(0.1))
                    .cornerRadius(10)
                }
            }
            .padding()
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct MenuItemView: View {
    let icon: String
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .frame(width: 30)
                .foregroundColor(.blue)
            
            Text(title)
                .font(.body)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.gray.opacity(0.05))
        .cornerRadius(10)
    }
}
