//
//  DognutView.swift
//  CoffeeBeansAnimationApp
//
//  Created by Alexandre Bevilacqua on 12.01.2025.
//

import SwiftUI

struct DoughnutView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Gift of flavor")
                .font(.headline)
                .padding(.top, 20)
            
            HStack {
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.brown)
                VStack(alignment: .leading) {
                    Text("Chocolate doughnut")
                        .font(.headline)
                    Text("Decadent doughnut to satisfy your sweet tooth.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text("$5")
                        .font(.title2)
                        .foregroundColor(.brown)
                }
            }
            .padding()
            .background(Color(UIColor.systemGray6))
            .cornerRadius(10)
            .padding(.top, 10)
        }
    }
}

struct DoughnutView_Previews: PreviewProvider {
    static var previews: some View {
        DoughnutView()
    }
}
