//
//  Player.swift
//  ScoreKeeper
//
//  Created by Mehta, Harshal on 2025-07-15.
//

import Foundation

struct Player: Identifiable{
    let id = UUID()
    
    var name: String
    var score : Int
}
