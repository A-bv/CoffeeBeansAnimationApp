//
//  CoffeeBeansAnimationAppApp.swift
//  CoffeeBeansAnimationApp
//
//  Created by Alexandre Bevilacqua on 11.01.2025.
//

import SwiftUI

@main
struct CoffeeApp: App {
    @State private var overlayVisible = true  // Control overlay visibility

    var body: some Scene {
        WindowGroup {
            ZStack {
                CoffeeHomeView()
                    .disabled(overlayVisible) // Disable CoffeeHomeView interaction while overlay is visible

                if overlayVisible {
                    CoffeeBeansOverlayView(isVisible: $overlayVisible)
                }
            }
        }
    }
}

