//
//  CalenderData.swift
//  Project7
//
//  Created by Ethan Allgaier on 11/10/25.
//

import SwiftUI
//Sample questions, this will be different later, when i put in the real api data.
let sampleCalendarItems: [CalendarItems] = [
    CalendarItems(
        id: UUID(),
        lessonID: "SF23",
        lessonName: "Intro to Swift",
        MainObjective: "Understand basics",
        readingDue: "Ch. 1–2",
        AssignmentsDue: "Project 7",
        newAssignment: "Setup Xcode",
        codeChallenge: "Variables Practice",
        wordOfTheDay: "Initialization"
    ),
    CalendarItems(
        id: UUID(),
        lessonID: "SF24",
        lessonName: "SwiftUI Basics",
        MainObjective: "Learn Views",
        readingDue: "Ch. 3",
        AssignmentsDue: "Quiz 2",
        newAssignment: "Build a Button App",
        codeChallenge: "Simple Grid",
        wordOfTheDay: "Modifier"
    ),
    CalendarItems(
        id: UUID(),
        lessonID: "SF25",
        lessonName: "State & Binding",
        MainObjective: "Manage state in views",
        readingDue: "Ch. 4",
        AssignmentsDue: "Project 8",
        newAssignment: "Counter App",
        codeChallenge: "Two-way Binding",
        wordOfTheDay: "State"
    ),
    CalendarItems(
        id: UUID(),
        lessonID: "SF26",
        lessonName: "Layouts in SwiftUI",
        MainObjective: "Use Stacks & Grids",
        readingDue: "Ch. 5",
        AssignmentsDue: "Quiz 3",
        newAssignment: "Design a Form",
        codeChallenge: "HStack & VStack",
        wordOfTheDay: "Spacer"
    ),
    CalendarItems(
        id: UUID(),
        lessonID: "SF27",
        lessonName: "Lists & Navigation",
        MainObjective: "Implement scrolling lists",
        readingDue: "Ch. 6",
        AssignmentsDue: "Project 9",
        newAssignment: "Todo List App",
        codeChallenge: "NavigationLink Demo",
        wordOfTheDay: "ForEach"
    ),
    CalendarItems(
        id: UUID(),
        lessonID: "SF28",
        lessonName: "Advanced SwiftUI",
        MainObjective: "Animations & Transitions",
        readingDue: "Ch. 7",
        AssignmentsDue: "Quiz 4",
        newAssignment: "Animate a Button",
        codeChallenge: "Fade & Slide",
        wordOfTheDay: "Transition"
    ),
    CalendarItems(
        id: UUID(),
        lessonID: "SF29",
        lessonName: "Data Flow",
        MainObjective: "Learn ObservableObject & Environment",
        readingDue: "Ch. 8",
        AssignmentsDue: "Project 10",
        newAssignment: "Settings Page App",
        codeChallenge: "ObservableObject Practice",
        wordOfTheDay: "Published"
    ),
    CalendarItems(
        id: UUID(),
        lessonID: "SF30",
        lessonName: "Networking",
        MainObjective: "Fetch data from APIs",
        readingDue: "Ch. 9",
        AssignmentsDue: "Quiz 5",
        newAssignment: "Fetch JSON App",
        codeChallenge: "URLSession Demo",
        wordOfTheDay: "Async/Await"
    ),
    CalendarItems(
        id: UUID(),
        lessonID: "SF31",
        lessonName: "Core Data Basics",
        MainObjective: "Persist data locally",
        readingDue: "Ch. 10",
        AssignmentsDue: "Project 11",
        newAssignment: "Notes App",
        codeChallenge: "Save & Fetch Entities",
        wordOfTheDay: "NSManagedObject"
    ),
    CalendarItems(
        id: UUID(),
        lessonID: "SF32",
        lessonName: "Gestures & Events",
        MainObjective: "Add interactivity",
        readingDue: "Ch. 11",
        AssignmentsDue: "Quiz 6",
        newAssignment: "Gesture Demo App",
        codeChallenge: "Tap & Drag",
        wordOfTheDay: "GestureRecognizer"
    ),
    CalendarItems(
        id: UUID(),
        lessonID: "SF33",
        lessonName: "Combine Basics",
        MainObjective: "Handle asynchronous events",
        readingDue: "Ch. 12",
        AssignmentsDue: "Project 12",
        newAssignment: "Publisher Subscriber Demo",
        codeChallenge: "Basic Combine Streams",
        wordOfTheDay: "Publisher"
    ),
    CalendarItems(
        id: UUID(),
        lessonID: "SF34",
        lessonName: "Final Project",
        MainObjective: "Build a complete SwiftUI app",
        readingDue: "All chapters",
        AssignmentsDue: "Final Submission",
        newAssignment: "Capstone App",
        codeChallenge: "Integrate Everything",
        wordOfTheDay: "Architecture"
    )
]
