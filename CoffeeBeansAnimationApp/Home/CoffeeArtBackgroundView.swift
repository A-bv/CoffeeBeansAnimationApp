//
//  CoffeeArtBackgroundView.swift
//  CoffeeBeansAnimationApp
//
//  Created by Alexandre Bevilacqua on 12.01.2025.
//

import SwiftUI

struct CoffeeArtBackgroundView: View {
    /// A single blurred circle in the animated backdrop. All of its randomized
    /// properties are computed once (at model-creation time) so the layout stays
    /// stable across re-renders instead of re-rolling on every `body` evaluation.
    private struct FloatingCircle: Identifiable {
        let id = UUID()
        let xFraction: CGFloat   // position as a fraction of the container width
        let yFraction: CGFloat   // position as a fraction of the container height
        let size: CGFloat
        let color: Color
        let opacity: Double
        let blur: CGFloat
        let targetScale: CGFloat // scale reached while animating
        let duration: Double
        let delay: Double
    }

    // Darker and richer coffee tones
    private static let colors: [Color] = [
        Color(.sRGB, red: 0.08, green: 0.04, blue: 0.02, opacity: 1.0), // Dark espresso brown
        Color(.sRGB, red: 0.18, green: 0.1, blue: 0.05, opacity: 1.0),  // Rich coffee brown
        Color(.sRGB, red: 0.3, green: 0.18, blue: 0.1, opacity: 1.0),   // Warm coffee brown
        Color(.sRGB, red: 0.5, green: 0.3, blue: 0.2, opacity: 1.0)     // Deep, warm brown
    ]

    private static func makeCircles(large: Bool) -> [FloatingCircle] {
        let count = large ? 20 : 10
        return (0..<count).map { _ in
            FloatingCircle(
                xFraction: .random(in: 0...1),
                yFraction: .random(in: 0...1),
                size: large ? .random(in: 40...150) : .random(in: 20...50),
                color: colors.randomElement() ?? colors[0],
                opacity: large ? .random(in: 0.05...0.25) : .random(in: 0.15...0.4),
                blur: large ? .random(in: 20...60) : .random(in: 5...20),
                targetScale: large ? .random(in: 0.5...2.0) : .random(in: 0.5...1.5),
                duration: large ? .random(in: 4.0...8.0) : .random(in: 6.0...12.0),
                delay: .random(in: 0...3.0)
            )
        }
    }

    @State private var circles: [FloatingCircle] = makeCircles(large: true) + makeCircles(large: false)
    @State private var animate = false
    @State private var gradientStartPoint = UnitPoint.topLeading
    @State private var gradientEndPoint = UnitPoint.bottomTrailing

    var body: some View {
        GeometryReader { geo in
            ZStack {
                // Background gradient with a slow, looping drift
                LinearGradient(
                    gradient: Gradient(colors: Self.colors),
                    startPoint: gradientStartPoint,
                    endPoint: gradientEndPoint
                )
                .ignoresSafeArea()
                .animation(
                    .linear(duration: 30.0).repeatForever(autoreverses: true),
                    value: gradientStartPoint
                )

                // Blurred coffee-toned circles that gently pulse forever.
                // The animation is driven by `animate`, which is toggled in
                // `onAppear`, so the scale change is actually animatable.
                ForEach(circles) { circle in
                    Circle()
                        .fill(circle.color)
                        .frame(width: circle.size, height: circle.size)
                        .position(
                            x: circle.xFraction * geo.size.width,
                            y: circle.yFraction * geo.size.height
                        )
                        .opacity(circle.opacity)
                        .scaleEffect(animate ? circle.targetScale : 1.0, anchor: .center)
                        .blur(radius: circle.blur)
                        .animation(
                            .easeInOut(duration: circle.duration)
                                .repeatForever(autoreverses: true)
                                .delay(circle.delay),
                            value: animate
                        )
                }
            }
        }
        .ignoresSafeArea()
        .onAppear {
            gradientStartPoint = .bottomLeading
            gradientEndPoint = .topTrailing
            animate = true
        }
    }
}

#Preview {
    CoffeeArtBackgroundView()
}
