//
//  MainView.swift
//  CoffeeBeansAnimationApp
//
//  Created by Alexandre Bevilacqua on 12.01.2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack {
            AbstractBackgroundView()
            CoffeeChoiceView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
