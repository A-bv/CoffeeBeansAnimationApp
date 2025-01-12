//
//  CoffeeChoiceView.swift
//  CoffeeBeansAnimationApp
//
//  Created by Alexandre Bevilacqua on 12.01.2025.
//

import SwiftUI

struct CoffeeChoiceView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Best choice")
                .foregroundColor(Color.white)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .padding()
            
            HStack(spacing: 0) {
                CoffeeBeanOption(name: "Robusta beans", description: "A strong, bold flavor and high caffeine content.", price: 15, imageName: "beansGlassNoB")
                CoffeeBeanOption(name: "Arabica beans", description: "Experience a smooth, low acidity flavor in your coffee.", price: 12, imageName: "beansGlassNoB")
            }
        }
        .padding(5)
    }
}

struct CoffeeChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            AbstractBackgroundView()
            CoffeeChoiceView()
        }
    }
}
