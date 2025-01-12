//
//  CoffeeBeansAnimationAppApp.swift
//  CoffeeBeansAnimationApp
//
//  Created by Alexandre Bevilacqua on 11.01.2025.
//

import SwiftUI

@main
struct CoffeeApp: App {
    @State private var overlayVisible = true

    var body: some Scene {
        WindowGroup {
            MainView()
            /*
            ZStack {
                MainView()
                    .disabled(overlayVisible)

                if overlayVisible {
                    CoffeeBeansOverlayView(isVisible: $overlayVisible)
                }
            }*/
        }
    }
}
