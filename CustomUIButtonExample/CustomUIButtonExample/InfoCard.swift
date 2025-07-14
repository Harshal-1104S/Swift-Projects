//
//  InfoCard.swift
//  CustomUIButtonExample
//
//  Created by Mehta, Harshal on 2025-07-14.
//

import SwiftUI

struct InfoCard: View {
    var title: String
    var subtitle: String
    var icon: String
    
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(.blue)
            
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
            
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.gray)
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 5, x: 0, y : 3)
    }
}

#Preview {
    InfoCard(
                title: "SwiftUI",
                subtitle: "Build custom UI components",
                icon: "star.fill"
            )
}
