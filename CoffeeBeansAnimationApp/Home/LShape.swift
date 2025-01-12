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
        
        // First rounded rectangle
        path.addRoundedRect(in: CGRect(x: rect.minX, y: rect.minY, width: rect.width - 60, height: rect.height), cornerSize: CGSize(width: cornerRadius, height: cornerRadius))
        
        // Second rounded rectangle
        path.addRoundedRect(in: CGRect(x: rect.minX, y: rect.minY, width: rect.width, height: rect.height - 60), cornerSize: CGSize(width: cornerRadius, height: cornerRadius))
        
        // Add a triangle in the inner angle
        let trianglePoint1 = CGPoint(x: rect.width - 60, y: rect.height - 60) // Start point of the triangle (corner of the L)
        let trianglePoint2 = CGPoint(x: rect.width - 30, y: rect.height - 60)   // End point of the base of the triangle
        let trianglePoint3 = CGPoint(x: rect.width - 60, y: rect.height - 30)   // Apex of the triangle (opposite the base)
        
        path.move(to: trianglePoint1)
        path.addLine(to: trianglePoint2)
        
        // Adjusted control point for a more visible curve
        let controlPoint = CGPoint(x: rect.width - 55, y: rect.height - 55) // Move control point away for more curvature
        path.addQuadCurve(to: trianglePoint3, control: controlPoint)
        
        path.closeSubpath()
        
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
