//
//  ProfileCard.swift
//  CustomUIButtonExample
//
//  Created by Mehta, Harshal on 2025-07-14.
//

import SwiftUI

struct ProfileCard: View {
    var imageName: String
    var name: String
    var bio: String
    var gradientColors: [Color]

    var body: some View {
        VStack(spacing: 12) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 5)

            Text(name)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)

            Text(bio)
                .font(.body)
                .multilineTextAlignment(.center)
                .foregroundColor(.white.opacity(0.9))
                .padding(.horizontal)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(
                gradient: Gradient(colors: gradientColors),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(15)
        .shadow(color: .gray.opacity(0.4), radius: 8, x: 0, y: 5)
        .padding(.horizontal)
    }
}

#Preview {
    ProfileCard(
        imageName: "person1",
        name: "Harshal Mehta",
        bio: "Aspiring iOS developer with a passion for UI/UX design and Swift.",
        gradientColors: [Color.blue, Color.purple]
    )
}
