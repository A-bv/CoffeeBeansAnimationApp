//
//  CoffeeBeansAnimationView.swift
//  CoffeeBeansAnimationApp
//
//  Created by Alexandre Bevilacqua on 11.01.2025.
//

import SwiftUI

/// Self-contained showcase: 50 coffee beans drift across the screen. Tapping
/// scatters them off-screen with a fade, then a fresh batch spawns in.
struct CoffeeBeansAnimationView: View {
    @State private var beans: [CoffeeBean] = CoffeeBeansAnimationView.makeBeans()

    private static func makeBeans() -> [CoffeeBean] {
        (0..<50).map { _ in
            CoffeeBean(
                // Positions are stored as fractions (0...1) of the container so
                // the layout is resolution-independent and works on any device.
                position: CGPoint(x: .random(in: 0...1), y: .random(in: 0...1)),
                speed: .random(in: 0.5...2.0),
                rotation: .degrees(.random(in: 0...360))
            )
        }
    }

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.clear
                    .contentShape(Rectangle())

                ForEach(beans) { bean in
                    Image("clearBean")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .position(
                            x: bean.position.x * geo.size.width,
                            y: bean.position.y * geo.size.height
                        )
                        .opacity(bean.opacity)
                        .rotationEffect(bean.rotation)
                        .animation(.easeInOut(duration: bean.speed), value: bean.position)
                        .animation(.easeInOut(duration: bean.speed), value: bean.opacity)
                }
            }
            .onTapGesture { scatter() }
        }
        .ignoresSafeArea()
    }

    /// Push every bean outward (intentionally past the edges) and fade it out,
    /// then respawn a new batch once the scatter animation has played.
    private func scatter() {
        for index in beans.indices {
            beans[index].position.x += .random(in: -0.6...0.6)
            beans[index].position.y += .random(in: -0.6...0.6)
            beans[index].opacity = 0
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            beans = Self.makeBeans()
        }
    }
}

struct CoffeeBean: Identifiable {
    let id = UUID()
    var position: CGPoint
    var speed: Double
    var opacity: Double = 1.0
    var rotation: Angle
}

#Preview {
    ZStack {
        CoffeeArtBackgroundView()
        CoffeeBeansAnimationView()
    }
}
