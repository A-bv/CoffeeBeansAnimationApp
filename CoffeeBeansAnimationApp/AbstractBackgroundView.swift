//
//  ttt.swift
//  CoffeeBeansAnimationApp
//
//  Created by Alexandre Bevilacqua on 12.01.2025.
//

import SwiftUI

struct AbstractBackgroundView: View {
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

            ForEach(0..<8) { _ in
                Circle()
                    .fill(Color(.sRGB, red: 0.45, green: 0.35, blue: 0.25, opacity: 1.0))
                    .frame(width: CGFloat.random(in: 50...150), height: CGFloat.random(in: 50...150))
                    .position(
                        x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                        y: CGFloat.random(in: 0...UIScreen.main.bounds.height)
                    )
                    .opacity(0.3)
                    .blur(radius: 30)
            }
        }
    }
}

struct AbstractBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        AbstractBackgroundView()
    }
}
