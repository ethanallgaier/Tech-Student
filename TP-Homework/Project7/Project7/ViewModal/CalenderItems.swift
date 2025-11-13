//
//  CalenderItems.swift
//  Project7
//
//  Created by Ethan Allgaier on 11/10/25.
//

import SwiftUI


struct CalendarItems:  Codable, Identifiable {
    var id = UUID()
    var lessonID: String
    var lessonName: String = "hello"
    var MainObjective: String = "hello"
    var readingDue: String = "hello"
    var AssignmentsDue: String = "hello"
    var newAssignment: String = "hello"
    var codeChallenge: String = "hello"
    var wordOfTheDay: String = "hello"
    
}
