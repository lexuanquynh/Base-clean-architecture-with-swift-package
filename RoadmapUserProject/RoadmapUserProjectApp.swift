//
//  RoadmapUserProjectApp.swift
//  RoadmapUserProject
//
//  Created by Prank on 17/9/25.
//

import SwiftUI
import Combine // Add this import
import Login
import Home
import Core
import DataLayer

@main
struct RoadmapUserProjectApp: App {
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
        }
    }
}
