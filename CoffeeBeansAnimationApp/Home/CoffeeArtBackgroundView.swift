//
//  ttt.swift
//  CoffeeBeansAnimationApp
//
//  Created by Alexandre Bevilacqua on 12.01.2025.
//

import SwiftUI

struct CoffeeArtBackgroundView: View {
    @State private var offset: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(.sRGB, red: 0.1, green: 0.05, blue: 0.02, opacity: 1.0),
                    Color(.sRGB, red: 0.2, green: 0.15, blue: 0.1, opacity: 1.0)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            ForEach(0..<4) { _ in
                Circle()
                    .fill(Color(.sRGB, red: 0.45, green: 0.35, blue: 0.25, opacity: 1.0))
                    .frame(width: CGFloat.random(in: 20...80), height: CGFloat.random(in: 20...100))
                    .position(
                        x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                        y: CGFloat.random(in: 0...UIScreen.main.bounds.height)
                    )
                    .blur(radius: 40)
                    .opacity(0.5)
                    .offset(x: offset, y: offset)
                    .animation(
                        Animation.linear(duration: 20.0)
                            .repeatForever(autoreverses: true),
                        value: offset
                    )
            }
        }
        .onAppear {
            offset = CGFloat.random(in: -50...50) // This randomizes the initial movement
        }
    }
}

struct AbstractBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeArtBackgroundView()
    }
}

