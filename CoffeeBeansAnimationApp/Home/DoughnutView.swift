//
//  DoughnutView.swift
//  CoffeeBeansAnimationApp
//
//  Created by Alexandre Bevilacqua on 12.01.2025.
//

import SwiftUI

/// A ring with a hole punched out of the centre, drawn with an even-odd fill.
struct DoughnutShape: Shape {
    var holeRatio: CGFloat = 0.42

    func path(in rect: CGRect) -> Path {
        let side = min(rect.width, rect.height)
        let outer = CGRect(
            x: rect.midX - side / 2, y: rect.midY - side / 2,
            width: side, height: side
        )
        let holeSide = side * holeRatio
        let inner = CGRect(
            x: rect.midX - holeSide / 2, y: rect.midY - holeSide / 2,
            width: holeSide, height: holeSide
        )
        var path = Path()
        path.addEllipse(in: outer)
        path.addEllipse(in: inner)
        return path
    }
}

/// A chocolate-glazed doughnut with sprinkles that slowly spins and gently bobs.
/// Sprinkles are generated once so their layout stays stable across re-renders.
struct AnimatedDoughnut: View {
    private struct Sprinkle: Identifiable {
        let id = UUID()
        let angle: Angle      // position around the ring
        let distance: CGFloat // fraction of the outer radius
        let tilt: Angle       // rotation of the sprinkle itself
        let color: Color
    }

    private static let sprinkleColors: [Color] = [.pink, .yellow, .mint, .white, .orange, .cyan]

    private static func makeSprinkles() -> [Sprinkle] {
        (0..<14).map { _ in
            Sprinkle(
                angle: .degrees(.random(in: 0...360)),
                distance: .random(in: 0.58...0.82),
                tilt: .degrees(.random(in: 0...180)),
                color: sprinkleColors.randomElement() ?? .white
            )
        }
    }

    @State private var sprinkles = AnimatedDoughnut.makeSprinkles()
    @State private var spin = false
    @State private var bob = false

    var body: some View {
        GeometryReader { geo in
            let side = min(geo.size.width, geo.size.height)
            let radius = side / 2

            ZStack {
                // Dough base
                DoughnutShape()
                    .fill(
                        Color(.sRGB, red: 0.78, green: 0.55, blue: 0.35, opacity: 1.0),
                        style: FillStyle(eoFill: true)
                    )

                // Chocolate glaze, slightly smaller and nudged up
                DoughnutShape()
                    .fill(
                        Color(.sRGB, red: 0.30, green: 0.16, blue: 0.08, opacity: 1.0),
                        style: FillStyle(eoFill: true)
                    )
                    .scaleEffect(0.92)
                    .offset(y: -side * 0.03)

                // Sprinkles riding on the glaze
                ForEach(sprinkles) { sprinkle in
                    Capsule()
                        .fill(sprinkle.color)
                        .frame(width: side * 0.025, height: side * 0.07)
                        .rotationEffect(sprinkle.tilt)
                        .offset(y: -radius * sprinkle.distance)
                        .rotationEffect(sprinkle.angle)
                        .offset(y: -side * 0.03)
                }
            }
            .frame(width: side, height: side)
            .rotationEffect(.degrees(spin ? 360 : 0))
            .offset(y: bob ? -8 : 8)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onAppear {
            withAnimation(.linear(duration: 14).repeatForever(autoreverses: false)) {
                spin = true
            }
            withAnimation(.easeInOut(duration: 2.2).repeatForever(autoreverses: true)) {
                bob = true
            }
        }
    }
}

struct DoughnutView: View {
    var body: some View {
        VStack(spacing: 28) {
            AnimatedDoughnut()
                .frame(width: 180, height: 180)

            VStack(alignment: .leading) {
                Text("Gift of flavor")
                    .font(.headline)
                    .padding(.bottom, 4)

                HStack {
                    AnimatedDoughnut()
                        .frame(width: 50, height: 50)
                    VStack(alignment: .leading) {
                        Text("Chocolate doughnut")
                            .font(.headline)
                        Text("Decadent doughnut to satisfy your sweet tooth.")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("$5")
                            .font(.title2)
                            .foregroundColor(.brown)
                    }
                }
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
            }
        }
        .padding()
    }
}

#Preview {
    DoughnutView()
}
