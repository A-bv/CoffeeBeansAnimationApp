//
//  CoffeeHomeView.swift
//  CoffeeBeansAnimationApp
//
//  Created by Alexandre Bevilacqua on 11.01.2025.
//

import SwiftUI

/// Simple showcase: a button that reveals a coffee cup with a scale transition.
struct CoffeeHomeView: View {
    @State private var showCoffee = false

    var body: some View {
        VStack {
            Button {
                withAnimation {
                    showCoffee.toggle()
                }
            } label: {
                Text(showCoffee ? "Hide Coffee" : "Show Coffee")
                    .font(.headline)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.brown)
                    .cornerRadius(8)
            }

            if showCoffee {
                Image(systemName: "cup.and.saucer.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.brown)
                    .padding()
                    .transition(.scale)
            }
        }
        .padding()
    }
}

#Preview {
    CoffeeHomeView()
}
