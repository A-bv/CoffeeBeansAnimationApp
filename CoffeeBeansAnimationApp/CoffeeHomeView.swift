//
//  ContentView.swift
//  CoffeeBeansAnimationApp
//
//  Created by Alexandre Bevilacqua on 11.01.2025.
//

import SwiftUI

struct CoffeeHomeView: View {
    @Binding var isVisible: Bool
    @State private var showCoffee = false

    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    showCoffee.toggle()
                }
                if showCoffee {
                    showBeans()
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
    
    private func showBeans() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            isVisible = true
            showCoffee = false
        }
    }
}

#Preview {
    CoffeeHomeView(isVisible: .constant(false))
}
