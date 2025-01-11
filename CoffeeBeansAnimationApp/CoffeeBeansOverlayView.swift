//
//  CoffeeBeansOverlay.swift
//  CoffeeBeansAnimationApp
//
//  Created by Alexandre Bevilacqua on 11.01.2025.
//

import SwiftUI

struct CoffeeBeansOverlayView: View {
    @State private var coffeeBeans = Array(0..<500).map { _ in
        CoffeeBean(position: CGPoint(x: Double.random(in: 0...UIScreen.main.bounds.width),
                                     y: Double.random(in: 0...UIScreen.main.bounds.height)),
                  speed: Double.random(in: 0.5...2.0)) // Random speed
    }
    @State private var tapLocation: CGPoint = .zero

    var body: some View {
        ZStack {
            Color.clear // Transparent background
                .ignoresSafeArea()
                .contentShape(Rectangle()) // Prevents interaction with CoffeeHomeView

            ForEach(coffeeBeans.indices, id: \.self) { index in
                Image("clearBean") // Replace with your coffee bean image in assets
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .position(coffeeBeans[index].position)
                    .opacity(coffeeBeans[index].opacity)
                    .animation(
                        .easeInOut(duration: coffeeBeans[index].speed),
                        value: coffeeBeans[index].position
                    )
            }
        }
        .onTapGesture { location in
            tapLocation = location
            withAnimation {
                moveBeansOffScreen()
            }
        }
    }

    private func moveBeansOffScreen() {
        for index in coffeeBeans.indices {
            let randomYOffset = CGFloat.random(in: -200...200)
            let randomXOffset = CGFloat.random(in: -200...200)

            // Apply the random movement and speed
            coffeeBeans[index].position.y += randomYOffset
            coffeeBeans[index].position.x += randomXOffset

            // Randomly set the opacity to gradually fade out
            coffeeBeans[index].opacity = 0

            // Ensure beans stay within screen bounds after they move
            coffeeBeans[index].position.x = min(max(coffeeBeans[index].position.x, 0), UIScreen.main.bounds.width)
            coffeeBeans[index].position.y = min(max(coffeeBeans[index].position.y, 0), UIScreen.main.bounds.height)
        }
    }
}

struct CoffeeBean {
    var position: CGPoint
    var speed: Double
    var opacity: Double = 1.0 // Start fully visible
}

#Preview {
    CoffeeBeansOverlayView()
}
