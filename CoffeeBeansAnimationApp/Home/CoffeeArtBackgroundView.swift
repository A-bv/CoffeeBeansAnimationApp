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
    
    let colors: [Color] = [
        Color(.sRGB, red: 0.1, green: 0.05, blue: 0.02, opacity: 1.0),
        Color(.sRGB, red: 0.25, green: 0.15, blue: 0.1, opacity: 1.0),
        Color(.sRGB, red: 0.2, green: 0.1, blue: 0.05, opacity: 1.0)
    ]
    
    var body: some View {
        ZStack {
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
            
            ForEach(0..<20) { _ in
                Circle()
                    .fill(self.colors.randomElement()!)
                    .frame(width: CGFloat.random(in: 50...150), height: CGFloat.random(in: 50...150))
                    .position(
                        x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                        y: CGFloat.random(in: 0...UIScreen.main.bounds.height)
                    )
                    .opacity(0.2)
                    .scaleEffect(scale)
                    .offset(x: offsetX, y: offsetY)
                    .blur(radius: CGFloat.random(in: 10...40))
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
