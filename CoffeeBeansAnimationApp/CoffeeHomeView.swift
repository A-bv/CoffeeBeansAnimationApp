//
//  ContentView.swift
//  CoffeeBeansAnimationApp
//
//  Created by Alexandre Bevilacqua on 11.01.2025.
//

import SwiftUI

struct CoffeeHomeView: View {
    @State private var showCoffee = false

    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    showCoffee.toggle()
                }
            }) {
                Text("Show Coffee")
                    .font(.headline)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.brown)
                    .cornerRadius(8)
            }

            if showCoffee {
                Image(systemName: "cup.and.saucer.fill") // System icon for coffee
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
