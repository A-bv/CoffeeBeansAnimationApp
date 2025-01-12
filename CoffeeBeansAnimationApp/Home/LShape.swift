//
//  LShapeView.swift
//  CoffeeBeansAnimationApp
//
//  Created by Alexandre Bevilacqua on 12.01.2025.
//

import SwiftUI

struct LShape: Shape {
    var cornerRadius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addRoundedRect(in: CGRect(x: rect.minX, y: rect.minY, width: rect.width - 60, height: rect.height), cornerSize: CGSize(width: cornerRadius, height: cornerRadius))
        path.addRoundedRect(in: CGRect(x: rect.minX, y: rect.minY, width: rect.width, height: rect.height - 60), cornerSize: CGSize(width: cornerRadius, height: cornerRadius))
        
        return path
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LShape(cornerRadius: 20)
            .frame(width: 200, height: 200)
            .foregroundColor(.blue)
            .padding()
    }
}
