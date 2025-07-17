//
//  Friend.swift
//  Birthdays
//
//  Created by Mehta, Harshal on 2025-07-17.
//

import Foundation
import SwiftData

@Model
class Friend {
    var name: String
    var birthday: Date

    init(name: String, birthday: Date) {
        self.name = name
        self.birthday = birthday
    }

    var isBirthdayToday: Bool {
        let today = Calendar.current.dateComponents([.month, .day], from: Date())
        let bday = Calendar.current.dateComponents([.month, .day], from: birthday)
        return today.month == bday.month && today.day == bday.day
    }
}
