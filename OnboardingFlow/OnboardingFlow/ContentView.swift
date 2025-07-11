//
//  ContentView.swift
//  OnboardingFlow
//
//  Created by Mehta, Harshal on 2025-07-08.
//

import SwiftUI

let gradientColors:[Color] = [
    .gradientTop,
    .gradientBottom
]

struct ContentView: View {
    var body: some View {
        TabView{
            WelcomePage()
            FeaturesPage()
        }
        .background(Gradient(colors: gradientColors))
        .tabViewStyle(.page)
        .foregroundStyle(.white)
    }
}

#Preview {
    ContentView()
}
