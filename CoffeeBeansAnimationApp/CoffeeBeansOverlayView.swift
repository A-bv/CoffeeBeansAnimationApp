//
//  CoffeeBeansOverlay.swift
//  CoffeeBeansAnimationApp
//
//  Created by Alexandre Bevilacqua on 11.01.2025.
//

import SwiftUI

struct CoffeeBeansOverlayView: View {
    @Binding var isVisible: Bool
    @State private var coffeeBeans = Array(0..<500).map { _ in
        CoffeeBean(
            position: CGPoint(x: Double.random(in: 0...UIScreen.main.bounds.width),
                              y: Double.random(in: 0...UIScreen.main.bounds.height)),
            speed: Double.random(in: 0.5...2.0), // Random speed
            rotation: Angle(degrees: Double.random(in: 0...360))
        )
    }

    @State private var tapLocation: CGPoint = .zero

    var body: some View {
        ZStack {
            Color.clear
                .ignoresSafeArea()
                .contentShape(Rectangle())

            ForEach(coffeeBeans.indices, id: \.self) { index in
                Image("clearBean")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .position(coffeeBeans[index].position)
                    .opacity(coffeeBeans[index].opacity)
                    .rotationEffect(coffeeBeans[index].rotation)
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
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                isVisible = false
            }
        }
    }

    private func moveBeansOffScreen() {
        for index in coffeeBeans.indices {
            let randomYOffset = CGFloat.random(in: -200...200)
            let randomXOffset = CGFloat.random(in: -200...200)

            coffeeBeans[index].position.y += randomYOffset
            coffeeBeans[index].position.x += randomXOffset

            coffeeBeans[index].opacity = 0

            coffeeBeans[index].position.x = min(max(coffeeBeans[index].position.x, 0), UIScreen.main.bounds.width)
            coffeeBeans[index].position.y = min(max(coffeeBeans[index].position.y, 0), UIScreen.main.bounds.height)
        }
    }
}

struct CoffeeBean {
    var position: CGPoint
    var speed: Double
    var opacity: Double = 1.0
    var rotation: Angle
}

#Preview {
    CoffeeBeansOverlayView(isVisible: .constant(true))
}
