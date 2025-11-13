//
//  Results.swift
//  PersonalityQuizLab
//
//  Created by Ethan Allgaier on 10/23/25.
//

import SwiftUI


struct ResultsView: View {
    @Environment(QuizManager.self) var quizManager

    var resultText: String {
        switch quizManager.calculateResults() {
        case .lion: return "Your spirit animal is a Lion!"
        case .cat: return "Your spirit animal is a Cat!"
        case .rabbit: return "Your spirit animal is a Rabbit!"
        case .turtle: return "Your spirit animal is a Turtle!"
        }
    }

    var body: some View {
        NavigationStack {
        ZStack {
            SmoothBackground()
            VStack {
                Spacer()
                VStack {
                }
                Text(resultText)
                    .font(.custom("Copperplate", size: 35))
                    .multilineTextAlignment(.center)
                    .bold()
                    .frame(width: 350, height: 200)
                    .padding()
                                .frame(width: 350, height: 425)
                .glassEffect( in: RoundedRectangle(cornerRadius: 20))
                    NavigationLink(destination: TitleView()) {
                        Text("Try Again!")
                            .font(.custom("Copperplate", size: 19))
                            .padding()
                            .frame(width: 350, height: 75)
                            .cornerRadius(20)
                            .foregroundColor(.blue)
                            .glassEffect(in: RoundedRectangle(cornerRadius: 20.0))
                    }
                Spacer()
                }
            }
            .frame(width: 375, height: 700)
            .glassEffect(.clear, in: RoundedRectangle(cornerRadius: 30))
            .cornerRadius(30)
            .navigationBarBackButtonHidden(true)
            
        }
    }
}

#Preview {
    ResultsView()
        .environment(QuizManager()) // Or whatever initializer you have
}

