//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Simon Delgado on 20/3/25.
//

import SwiftUI

@main
struct CryptoAppApp: App {
    @State private var navigationCoordinator: NavigationCoordinator = NavigationCoordinator()
    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(navigationCoordinator)
        }
    }
}
