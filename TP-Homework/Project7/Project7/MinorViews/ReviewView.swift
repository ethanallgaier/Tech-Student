//
//  ReviewView.swift
//  Project7
//
//  Created by Ethan Allgaier on 11/12/25.
//

import SwiftUI

struct ReviewView: View {

            @State private var wentWell = ""
            @State private var stillConfused = ""
            @State private var suggestions = ""
            
            var body: some View {
                NavigationStack {
                    Form {
                        Section(header: Text("What went well in today's lesson?")) {
                            TextField("Type your answer here", text: $wentWell)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        
                        Section(header: Text("What are you still confused about?")) {
                            TextField("Type your answer here", text: $stillConfused)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        
                        Section(header: Text("What suggestions for activities or changes to the lesson do you have?")) {
                            TextField("Type your answer here", text: $suggestions)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        
                        Button("Submit Feedback") {
                            print("Went well:", wentWell)
                            print("Still confused:", stillConfused)
                            print("Suggestions:", suggestions)
                            // need to add some saving logic here
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .navigationTitle("Lesson Feedback")
                }
            }
        }










        #Preview {
            ReviewView()
        }




