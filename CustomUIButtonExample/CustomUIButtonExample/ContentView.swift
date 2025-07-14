//
//  ContentView.swift
//  CustomUIButtonExample
//
//  Created by Mehta, Harshal on 2025-07-14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                GradientButton(
                    title: "Tap Me",
                    gradientColors: [Color.blue, Color.purple]
                ) {
                    print("Button tapped!")
                }

                GradientButton(
                    title: "Learn More",
                    gradientColors: [Color.orange, Color.red]
                ) {
                    print("Learn More button tapped!")
                }

                ProfileCard(
                    imageName: "person1",
                    name: "Harshal Mehta",
                    bio: "SwiftUI enthusiast building clean and custom iOS interfaces.",
                    gradientColors: [Color.green, Color.teal]
                )
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
