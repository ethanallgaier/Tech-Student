//
//  QuizManager.swift
//  PersonalityQuizLab
//
//  Created by Ethan Allgaier on 10/23/25.
//

import Foundation
internal import Combine


@Observable
class QuizManager {
    var currentQuestion = 0
    var selectedAnswers: [Answer] = []

    let questionList: [Question] = [
        Question(
            text: "What is your favorite color",
            type: .single,
            answers: [
                Answer(text: "Red", type: .lion),
                Answer(text: "yellow", type: .cat),
                Answer(text: "Blue", type: .rabbit),
                Answer(text: "Green", type: .turtle)
            ]
        ),
        Question(
            text: "Which food do you like the most?",
            type: .single,
            answers: [
                Answer(text: "Steak", type: .lion),
                Answer(text: "Fish", type: .cat),
                Answer(text: "Carrots", type: .rabbit),
                Answer(text: "Corn", type: .turtle)
            ]
        ),
        Question(
            text: "Which activities do you enjoy?",
            type: .multiple,
            answers: [
                Answer(text: "Swimming", type: .turtle),
                Answer(text: "Sleeping", type: .cat),
                Answer(text: "Cuddling", type: .rabbit),
                Answer(text: "Eating", type: .lion)
            ]
        ),
        Question(
            text: "How much do you enjoy Roller coasters?",
            type: .ranged,
            answers: [
                Answer(text: "I dislike them", type: .cat),
                Answer(text: "I get a little nervous", type: .rabbit),
                Answer(text: "I barely notice them", type: .turtle),
                Answer(text: "I love them", type: .lion)
            ]
        )
    ]

    func selectAnswer(_ answer: Answer) {
        selectedAnswers.append(answer)
    }

    func calculateResults() -> AnimalType {
        // Make a list of all the animals the user picked
        let allAnimals = selectedAnswers.map { $0.type }
        
        // If they didn’t pick anything, just say they’re a cat
        guard !allAnimals.isEmpty else { return .cat }
        
        // Count how many times each animal appears
        var counts: [AnimalType: Int] = [:]
        for animal in allAnimals {
            counts[animal, default: 0] += 1
        }
        
        // Find the animal with the biggest number
        let winner = counts.max { $0.value < $1.value }?.key ?? .cat
        
        return winner
    }
}
