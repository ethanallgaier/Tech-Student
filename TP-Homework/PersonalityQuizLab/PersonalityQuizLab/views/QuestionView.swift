

//
//  RangedQuestionSubview.swift
//  PersonalityQuizLab
//
//  Created by Ethan Allgaier on 10/23/25.
//

import SwiftUI


struct RangedQuestionSubview: View {
    @Environment(QuizManager.self) var quizManager
    let question: Question
    @State var sliderValue = 2.0
    

    private var sliderNumber: Int {
        switch Int(sliderValue) {
        case 0: return 0
        case 1: return 2
        case 2: return 3
        case 3: return 5
        default: return 0
        }
    }

    private var sliderText: String {
        switch Int(sliderValue) {
        case 0: return "I HATE THEM😡"
        case 1: return "I get pretty nervous"
        case 2: return "I think they are fun "
        case 3: return "I love them😍"
        default: return ""
        }
    }
    var body: some View {
        ZStack {
            SmoothBackground()
            VStack {
                Text(question.text)
                    .font(.custom("Copperplate", size: 45))
                    .multilineTextAlignment(.center)
                    .bold()
                    .frame(width: 350, height: 200)
                    .padding()
                Spacer()
                VStack {
                    Text("🤩 \(sliderNumber) / 5 🤩")
                        .font(.custom("Copperplate", size: 40))
                        

                    Slider(value: $sliderValue, in: 0...3, step: 1)
                        .padding()
                        .tint(.white)
                        .padding()
                    Text(sliderText)
                        .padding()
                        .font(.custom("Copperplate", size: 25))
                        .padding(.bottom)
                        
                }
                .frame(width: 350, height: 350)
                .glassEffect( in: RoundedRectangle(cornerRadius: 20))
                
                Button {
                    let index = Int(sliderValue)
                    let clamped = max(0, min(index, question.answers.count - 1))
                    let answer = question.answers[clamped]
                    quizManager.selectAnswer(answer)
                    quizManager.currentQuestion += 1
                } label: {
                    Text("Next")
                        .font(.custom("Copperplate", size: 19))
                        .padding()
                        .frame(width: 350, height: 75)
                        .cornerRadius(20)
                        .foregroundColor(.blue)
                        .glassEffect(in: RoundedRectangle(cornerRadius: 20.0))
                }
                Spacer()
            }
            .frame(width: 375, height: 700)
            .glassEffect(.clear, in: RoundedRectangle(cornerRadius: 30))
            .cornerRadius(30)
            .navigationBarBackButtonHidden(true)
        }
    }
}



struct MultipleQuestionSubview: View {
    @State var viewModel: MultipleChoiceQuestionViewModel
//  without @Bindable your view would just do nothing, showing data but not updating when it changes.
    var body: some View {
        ZStack {
            SmoothBackground()
            VStack {
                
                Text(viewModel.question.text)
                    .font(.custom("Copperplate", size: 44))
                    .multilineTextAlignment(.center)
                    .bold()
                    .frame(width: 350, height: 200)
                    .padding()
                
                Spacer()
                VStack{
                    
                    Toggle(viewModel.question.answers[0].text, isOn: $viewModel.option1)
                        .padding()
                    Toggle(viewModel.question.answers[1].text, isOn: $viewModel.option2)
                        .padding()
                    Toggle(viewModel.question.answers[2].text, isOn: $viewModel.option3)
                        .padding()
                    Toggle(viewModel.question.answers[3].text, isOn: $viewModel.option4)
                        .padding()
                }
                .tint(.white)
                .font(.custom("Copperplate", size: 25))
                .frame(width: 350, height: 350)
                .glassEffect( in: RoundedRectangle(cornerRadius: 20))
                Button {
                    let answers = viewModel.question.answers
                    if viewModel.option1 { viewModel.quizManager.selectAnswer(answers[0]) }
                    if viewModel.option2 { viewModel.quizManager.selectAnswer(answers[1]) }
                    if viewModel.option3 { viewModel.quizManager.selectAnswer(answers[2]) }
                    if viewModel.option4 { viewModel.quizManager.selectAnswer(answers[3]) }
                    viewModel.quizManager.currentQuestion += 1
                } label: {
                    Text("Next")
                        .font(.custom("Copperplate", size: 19))
                        .padding()
                        .frame(width: 350, height: 75)
                        .cornerRadius(20)
                        .foregroundColor(.blue)
                        .glassEffect(in: RoundedRectangle(cornerRadius: 20.0))
                }
                Spacer()
            }
            .frame(width: 375, height: 700)
            .glassEffect(.clear, in: RoundedRectangle(cornerRadius: 30))
            .cornerRadius(30)
            .navigationBarBackButtonHidden(true)
            
        }
    }
}



struct SingleQuestionSubview: View {
    @Environment(QuizManager.self) var quizManager
    let question: Question

    var body: some View {
        ZStack {
            SmoothBackground()
            VStack {
                Text(question.text)
                    .font(.custom("Copperplate", size: 45))
                    .multilineTextAlignment(.center)
                    .bold()
                    .frame(width: 350, height: 200)
                    .padding()
                Spacer()
                VStack(spacing: 20) {
                    ForEach(question.answers, id: \.self) { answer in
                        Button {
                            quizManager.selectAnswer(answer)
                            quizManager.currentQuestion += 1
                        } label: {
                            Text(answer.text)
                                .font(.custom("Copperplate", size: 20))
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundColor(.black)
                                .glassEffect(in: RoundedRectangle(cornerRadius: 14))
                        }
                    }
                }
                .frame(width: 350, height: 350)
                .glassEffect( in: RoundedRectangle(cornerRadius: 20))
                Spacer()
            }
            .frame(width: 375, height: 700)
            .glassEffect(.clear, in: RoundedRectangle(cornerRadius: 30))
            .cornerRadius(30)
            .navigationBarBackButtonHidden(true)
        }
    }
}



