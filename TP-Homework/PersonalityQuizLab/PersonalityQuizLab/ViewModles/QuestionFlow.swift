//
//  QuestionFlow.swift
//  PersonalityQuizLab
//
//  Created by Ethan Allgaier on 10/23/25.
//

import SwiftUI


struct QuestionFlowView: View {
    @Environment(QuizManager.self) var quizManager
    
    var body: some View {
        if quizManager.currentQuestion < quizManager.questionList.count {
            let question = quizManager.questionList[quizManager.currentQuestion]

            switch question.type {
            case .single:
                SingleQuestionSubview(question: question)
            case .multiple:
                MultipleQuestionSubview(viewModel: MultipleChoiceQuestionViewModel(quizManager: quizManager, question: question))
            case .ranged:
                RangedQuestionSubview(question: question)
            }
        } else {
            ResultsView()
        }
    }
}

