//
//  CoffeeSteamView.swift
//  CoffeeBeansAnimationApp
//
//  Created by Alexandre Bevilacqua on 29.06.2026.
//

import SwiftUI

/// Self-contained showcase: wisps of steam rise from a coffee cup, swaying and
/// fading out as they climb, looping forever.
struct CoffeeSteamView: View {
    /// One steam wisp. Randomized properties are computed once so the rising
    /// pattern stays stable across re-renders.
    private struct Wisp: Identifiable {
        let id = UUID()
        let xOffset: CGFloat   // horizontal position relative to the cup centre
        let size: CGFloat
        let sway: CGFloat      // horizontal drift while rising
        let duration: Double
        let delay: Double
    }

    private static func makeWisps() -> [Wisp] {
        (0..<7).map { index in
            Wisp(
                xOffset: .random(in: -26...26),
                size: .random(in: 18...32),
                sway: .random(in: 12...26),
                duration: .random(in: 2.5...4.0),
                delay: Double(index) * 0.35
            )
        }
    }

    @State private var wisps = CoffeeSteamView.makeWisps()
    @State private var animate = false

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    Color(.sRGB, red: 0.12, green: 0.07, blue: 0.04, opacity: 1.0),
                    Color(.sRGB, red: 0.04, green: 0.02, blue: 0.01, opacity: 1.0)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            ZStack {
                ForEach(wisps) { wisp in
                    Capsule()
                        .fill(.white)
                        .frame(width: wisp.size * 0.5, height: wisp.size)
                        .blur(radius: 7)
                        .opacity(animate ? 0 : 0.5)
                        .offset(
                            x: wisp.xOffset + (animate ? wisp.sway : -wisp.sway),
                            y: animate ? -190 : -55
                        )
                        .animation(
                            .easeOut(duration: wisp.duration)
                                .repeatForever(autoreverses: false)
                                .delay(wisp.delay),
                            value: animate
                        )
                }

                Image(systemName: "cup.and.saucer.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140, height: 140)
                    .foregroundStyle(.brown)
            }
        }
        .onAppear { animate = true }
    }
}

#Preview {
    CoffeeSteamView()
}
