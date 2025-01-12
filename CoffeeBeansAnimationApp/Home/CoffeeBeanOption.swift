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
                        .padding(.top, 50)
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(Color(UIColor.systemGray4))
                        .foregroundColor(.gray)
                        .padding(.top, 5)
                    
                    Text("\(price, specifier: "%.0f") USD")
                        .foregroundColor(Color(UIColor.systemGray6))
                        .font(.headline)
                        .padding(.top, 40)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    ZStack {
                        LShape(cornerRadius: 20)
                            .fill(.ultraThinMaterial)
                            .opacity(0.3)
                            .shadow(radius: 5)
                    }
                )
                .cornerRadius(10)
                .padding(10)
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
            HStack(spacing: 0) {
                CoffeeBeanOption(name: "Robusta beans", description: "A strong, bold flavor and high caffeine content.", price: 15, imageName: "beansGlassNoB")
                CoffeeBeanOption(name: "Arabica beans", description: "Experience a smooth, low acidity flavor in your coffee.", price: 12, imageName: "beansGlassNoB")
            }
        }
        .ignoresSafeArea()
    }
}
