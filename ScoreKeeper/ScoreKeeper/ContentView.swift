//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by Mehta, Harshal on 2025-07-15.
//

import SwiftUI

struct ContentView: View {
    @State private var players: [Player] = [
        Player(name: "Elisha", score: 0),
        Player(name: "Andre", score: 0),
        Player(name: "Jasmine", score: 0)
    ]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Score Keeper")
                .font(.title)
                .bold()
                .padding(.bottom)

            Grid {
                GridRow {
                    Text("Player")
                        .gridColumnAlignment(.leading)
                    Text("Score")
                }
                .font(.headline)

                ForEach($players) { $player in
                    GridRow {
                        TextField("Name", text: $player.name)
                        Text("\(player.score)")
                        Stepper("", value: $player.score)
                            .labelsHidden()
                    }
                }
            }

            Button(action: {
                players.append(Player(name: "", score: 0))
            }) {
                Label("Add Player", systemImage: "plus")
            }
            .padding(.top)

            Spacer()
        }
        .padding(.vertical)
        .padding(.horizontal)
    }
}

#Preview {
    ContentView()
}
