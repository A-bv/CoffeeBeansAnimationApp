//
//  CoffeeBeanOption.swift
//  CoffeeBeansAnimationApp
//
//  Created by Alexandre Bevilacqua on 12.01.2025.
//

import SwiftUI

struct CoffeeBeanOption: View {
    var name: String
    var description: String
    var price: Double
    var imageName: String

    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.headline)
                        .foregroundColor(Color(UIColor.systemGray6))
                        .padding(.top, 50) // Adds space under the image
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(Color(UIColor.systemGray4))
                        .foregroundColor(.gray)
                        .padding(.top, 5)
                    
                    Text("\(price, specifier: "%.0f") USD")
                        .foregroundColor(Color(UIColor.systemGray6))
                        .font(.headline)
                        .padding(.top, 10)
                }
                .padding(.bottom, 40)
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
                .cornerRadius(10)
                .shadow(radius: 5)
            }

            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .clipShape(Circle())
                .offset(y: -60)
        }
        .padding(.top, 60)
    }
}

struct CoffeeBeanOption_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            AbstractBackgroundView()
            CoffeeBeanOption(
                name: "Robusta beans",
                description: "A strong, bold flavor and high caffeine content.",
                price: 15,
                imageName: "beansGlassNoB"
            )
        }
        .ignoresSafeArea()
    }
}
