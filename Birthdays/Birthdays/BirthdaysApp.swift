//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by Mehta, Harshal on 2025-07-17.
//

import SwiftUI
import SwiftData

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
