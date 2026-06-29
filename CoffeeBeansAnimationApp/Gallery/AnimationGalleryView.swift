//
//  AnimationGalleryView.swift
//  CoffeeBeansAnimationApp
//
//  Created by Alexandre Bevilacqua on 29.06.2026.
//

import SwiftUI

/// Root of the app: a scrollable portfolio of animation showcases. Each card
/// pushes its demo full-screen via the navigation stack.
struct AnimationGalleryView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(AnimationDemo.allCases) { demo in
                        NavigationLink {
                            demo.destination
                                .navigationTitle(demo.rawValue)
                                .navigationBarTitleDisplayMode(.inline)
                        } label: {
                            GalleryCard(demo: demo)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
            .navigationTitle("Animations")
            .background(Color(UIColor.systemGroupedBackground))
        }
    }
}

/// A single row in the gallery list.
private struct GalleryCard: View {
    let demo: AnimationDemo

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: demo.symbol)
                .font(.system(size: 26))
                .foregroundColor(.brown)
                .frame(width: 52, height: 52)
                .background(Color.brown.opacity(0.12))
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))

            VStack(alignment: .leading, spacing: 4) {
                Text(demo.rawValue)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(demo.subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(demo.rawValue). \(demo.subtitle)")
        .accessibilityAddTraits(.isButton)
    }
}

#Preview {
    AnimationGalleryView()
}
