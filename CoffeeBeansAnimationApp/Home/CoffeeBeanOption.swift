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
            VStack(alignment: .leading, spacing: 0) {
                Text(name)
                    .font(.headline)
                    .foregroundColor(Color(UIColor.systemGray6))
                    .padding(.top, 50)
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(Color(UIColor.systemGray4))
                    .padding(.top, 5)
                    // Reserve a consistent block for the description so cards
                    // with shorter/longer copy still end up the same height.
                    .frame(minHeight: 72, alignment: .top)

                Text("\(price, specifier: "%.0f") USD")
                    .foregroundColor(Color(UIColor.systemGray6))
                    .font(.headline)
                    .padding(.top, 24)
            }
            .padding()
            // Flexible width keeps both cards inside the screen (no clipped
            // arrow). Height now hugs the (equalized) content instead of
            // stretching to fill the screen.
            .frame(maxWidth: .infinity, alignment: .topLeading)
            .background(
                ZStack(alignment: .bottomTrailing) {
                    LShape(cornerRadius: 20)
                        .fill(.ultraThinMaterial)
                        .opacity(0.3)
                        .shadow(radius: 5)

                    Button(action: {

                    }) {
                        Image(systemName: "arrow.right.circle.fill")
                            .foregroundColor(Color("Chocolat"))
                            .font(.system(size: 50))
                            .frame(width: 55, height: 55)
                            .clipShape(Circle())
                    }
                }
            )
            .cornerRadius(10)
            .padding(10)

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
            CoffeeArtBackgroundView()
            HStack(spacing: 0) {
                CoffeeBeanOption(name: "Robusta beans", description: "A strong, bold flavor and high caffeine content.", price: 15, imageName: "beansGlassNoB")
                CoffeeBeanOption(name: "Arabica beans", description: "Experience a smooth, low acidity flavor in your coffee.", price: 12, imageName: "beansGlassNoB")
            }
        }
        .ignoresSafeArea()
    }
}
