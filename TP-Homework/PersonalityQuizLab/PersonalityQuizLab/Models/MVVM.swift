//
//  MVVM.swift
//  PersonalityQuizLab
//
//  Created by Ethan Allgaier on 10/29/25.
//

import SwiftUI
//Tracks changes.
//With @Observable is detects changes and refreshes the view automaticly with the data.
//Detect changes, without @Observable if option1 changes the UI wont update.
@Observable
class MultipleChoiceQuestionViewModel {
    let quizManager: QuizManager
    let question: Question
    var option1: Bool // Remove @State. Because they are in a class not a View there is no need for @State
    var option2: Bool 
    var option3: Bool // replacement for @StateObject, @ObservedObject, and @Published.
    var option4: Bool
    
    init(quizManager: QuizManager, question: Question, option1: Bool = false, option2: Bool = false, option3: Bool = false, option4: Bool = false) {
        self.quizManager = quizManager
        self.question = question
        self.option1 = option1
        self.option2 = option2
        self.option3 = option3
        self.option4 = option4
    }
}
