//
//  CoffeeBeansAnimationAppApp.swift
//  CoffeeBeansAnimationApp
//
//  Created by Alexandre Bevilacqua on 11.01.2025.
//

import SwiftUI

@main
struct CoffeeApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack {
                CoffeeHomeView()
                CoffeeBeansOverlayView()
            }
        }
    }
}
