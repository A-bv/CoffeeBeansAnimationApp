//
//  AnimationDemo.swift
//  CoffeeBeansAnimationApp
//
//  Created by Alexandre Bevilacqua on 29.06.2026.
//

import SwiftUI

/// Each case is one entry in the animation portfolio. Adding a new showcase is
/// a single case here plus a branch in `destination` — the gallery picks it up
/// automatically via `CaseIterable`.
enum AnimationDemo: String, CaseIterable, Identifiable {
    case coffeeShop = "Coffee Shop"
    case floatingBeans = "Floating Beans"
    case coffeeArt = "Coffee Art Background"
    case revealCup = "Reveal Cup"
    case doughnutCard = "Doughnut Card"

    var id: String { rawValue }

    var subtitle: String {
        switch self {
        case .coffeeShop:      return "Animated storefront with glass cards"
        case .floatingBeans:   return "Tap to scatter 50 drifting beans"
        case .coffeeArt:       return "Pulsing blurred gradient backdrop"
        case .revealCup:       return "Button-triggered scale transition"
        case .doughnutCard:    return "Product card layout"
        }
    }

    var symbol: String {
        switch self {
        case .coffeeShop:      return "storefront.fill"
        case .floatingBeans:   return "sparkles"
        case .coffeeArt:       return "circle.hexagongrid.fill"
        case .revealCup:       return "cup.and.saucer.fill"
        case .doughnutCard:    return "circle.dashed"
        }
    }

    @ViewBuilder
    var destination: some View {
        switch self {
        case .coffeeShop:
            MainView()
        case .floatingBeans:
            ZStack {
                CoffeeArtBackgroundView()
                CoffeeBeansAnimationView()
            }
        case .coffeeArt:
            CoffeeArtBackgroundView()
        case .revealCup:
            CoffeeHomeView()
        case .doughnutCard:
            DoughnutView()
                .padding()
        }
    }
}
