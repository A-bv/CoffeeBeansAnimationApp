//
//  ttt.swift
//  CoffeeBeansAnimationApp
//
//  Created by Alexandre Bevilacqua on 12.01.2025.
//

import SwiftUI

struct CoffeeArtBackgroundView: View {
    @State private var movement: CGFloat = 0.0
    @State private var scale: CGFloat = 1.0
    @State private var offsetX: CGFloat = 0
    @State private var offsetY: CGFloat = 0
    @State private var gradientStartPoint = UnitPoint.topLeading
    @State private var gradientEndPoint = UnitPoint.bottomTrailing
    
    // Darker and richer coffee tones
    let colors: [Color] = [
        Color(.sRGB, red: 0.08, green: 0.04, blue: 0.02, opacity: 1.0), // Dark espresso brown
        Color(.sRGB, red: 0.18, green: 0.1, blue: 0.05, opacity: 1.0),  // Rich coffee brown
        Color(.sRGB, red: 0.3, green: 0.18, blue: 0.1, opacity: 1.0),   // Warm coffee brown
        Color(.sRGB, red: 0.5, green: 0.3, blue: 0.2, opacity: 1.0)     // Deep, warm brown
    ]
    
    var body: some View {
        ZStack {
            // Background gradient with smooth animation
            LinearGradient(
                gradient: Gradient(colors: colors),
                startPoint: gradientStartPoint,
                endPoint: gradientEndPoint
            )
            .edgesIgnoringSafeArea(.all)
            .animation(
                Animation.linear(duration: 30.0)
                    .repeatForever(autoreverses: true),
                value: gradientStartPoint
            )
            
            // First set of circles with reduced complexity
            ForEach(0..<80) { _ in
                Circle()
                    .fill(self.colors.randomElement()!)
                    .frame(width: CGFloat.random(in: 40...150), height: CGFloat.random(in: 40...150))
                    .position(
                        x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                        y: CGFloat.random(in: 0...UIScreen.main.bounds.height)
                    )
                    .opacity(Double.random(in: 0.05...0.25))
                    .scaleEffect(CGFloat.random(in: 0.5...2.0), anchor: .center)
                    .blur(radius: CGFloat.random(in: 20...60))
                    .animation(
                        Animation.easeInOut(duration: Double.random(in: 4.0...8.0))
                            .repeatForever(autoreverses: true)
                            .delay(Double.random(in: 0...3.0)),
                        value: offsetX
                    )
            }
            
            // Second set of smaller circles with similar optimization
            ForEach(0..<30) { _ in
                Circle()
                    .fill(self.colors.randomElement()!)
                    .frame(width: CGFloat.random(in: 20...50), height: CGFloat.random(in: 20...50))
                    .position(
                        x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                        y: CGFloat.random(in: 0...UIScreen.main.bounds.height)
                    )
                    .opacity(Double.random(in: 0.15...0.4))
                    .scaleEffect(CGFloat.random(in: 0.5...1.5), anchor: .center)
                    .blur(radius: CGFloat.random(in: 5...20))
                    .animation(
                        Animation.easeInOut(duration: Double.random(in: 6.0...12.0))
                            .repeatForever(autoreverses: true)
                            .delay(Double.random(in: 0...3.0)),
                        value: offsetX
                    )
            }
        }
        .onAppear {
            self.movement = CGFloat.random(in: -30...30)
            self.scale = CGFloat.random(in: 0.9...1.1)
            
            self.gradientStartPoint = .bottomLeading
            self.gradientEndPoint = .topTrailing
            
            self.offsetX = CGFloat.random(in: -50...50)
            self.offsetY = CGFloat.random(in: -50...50)
        }
    }
}

struct AbstractBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeArtBackgroundView()
    }
}
