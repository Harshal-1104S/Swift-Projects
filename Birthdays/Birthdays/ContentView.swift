//
//  ContentView.swift
//  Birthdays
//
//  Created by Mehta, Harshal on 2025-07-17.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query(sort: \Friend.birthday) private var friends: [Friend]
    @Environment(\.modelContext) private var context
    @State private var nameName = ""
    @State private var newDate = Date.now

    var body: some View {
        NavigationStack {
            List(friends) { friend in
                HStack {
                    if friend.isBirthdayToday {
                        Image(systemName: "birthday.cake")
                    }
                    Text(friend.name)
                        .fontWeight(friend.isBirthdayToday ? .bold : .regular)
                    Spacer()
                    Text(friend.birthday, format: .dateTime.month(.wide).day().year())
                }
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge: .bottom) {
                VStack(alignment: .center, spacing: 20) {
                    Text("New Birthday")
                        .font(.headline)
                    DatePicker(selection: $newDate, in: Date.distantPast...Date.now, displayedComponents: .date) {
                        Text("Birthday")
                    }
                    TextField("Name", text: $nameName)
                        .textFieldStyle(.roundedBorder)

                    Button("Save") {
                        let newFriend = Friend(name: nameName, birthday: newDate)
                        context.insert(newFriend)
                        nameName = ""
                        newDate = .now
                    }
                    .bold()
                }
                .padding()
                .background(.bar)
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Friend.self, inMemory: true)
}
