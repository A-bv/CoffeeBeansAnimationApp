//
//  ttt.swift
//  CoffeeBeansAnimationApp
//
//  Created by Alexandre Bevilacqua on 12.01.2025.
//

import SwiftUI

struct AbstractBackgroundView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color(.sRGB, red: 0.2, green: 0.1, blue: 0.05, opacity: 1.0), // Dark brown
                Color(.sRGB, red: 0.4, green: 0.3, blue: 0.2, opacity: 1.0)   // Lighter brown
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
       
        .edgesIgnoringSafeArea(.all)
    }
}

struct AbstractBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        AbstractBackgroundView()
    }
}

