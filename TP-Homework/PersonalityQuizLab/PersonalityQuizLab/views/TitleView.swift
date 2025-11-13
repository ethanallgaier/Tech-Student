//
//  TitleView.swift
//  PersonalityQuizLab
//
//  Created by Ethan Allgaier on 10/23/25.
//

import SwiftUI

struct TitleView: View {
    @State var quizManager = QuizManager()
    
    var body: some View {
        NavigationStack {
            ZStack {
                SmoothBackground()
                
                VStack {
                    HStack {
                        Spacer()
                        
                        Image(systemName: "dog.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 75, height: 75)
                            .padding()
                        
                        Image(systemName: "cat.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 75, height: 75)
                            .padding()
                        
                        Image(systemName: "bird.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 75, height: 75)
                            .padding()
                        
                        Spacer()
                    }
                    .padding(.top, 50)
                    
                    Text("Spirit Animal Quiz")
                        .font(.custom("Copperplate", size: 50))
                        .multilineTextAlignment(.center)
                        .bold()
                        .frame(width: 350, height: 200)
                        .padding()
                    
                    Spacer()
                    
                    NavigationLink {
                        QuestionFlowView()
                            .environment(quizManager)
                    } label: {
                        Text("START QUIZ")
                            .font(.custom("Copperplate", size: 19))
                            .padding()
                            .frame(width: 350, height: 75)
                            .cornerRadius(20)
                            .foregroundColor(.blue)
                            .glassEffect(in: RoundedRectangle(cornerRadius: 20.0))
                    }
                    
                    Spacer().frame(height: 25)
                }
                .frame(width: 375, height: 700)
                .glassEffect(.clear, in: RoundedRectangle(cornerRadius: 30))
                .cornerRadius(30)
            }
        }
    }
}
