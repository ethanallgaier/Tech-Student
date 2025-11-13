//
//  TodaysView.swift
//  Project7
//
//  Created by Ethan Allgaier on 11/10/25.
//

import SwiftUI
//Todays view depending on the date, this should change everyday.
//Shows todays class info
struct TodaysView: View {
    @Binding var viewModal: TodaysViewModal
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()
                VStack {
                    Text("Today")//This is the title
                        .font(.custom("DIN Alternate", size: 70))
                        .foregroundColor(.black)
                        .padding()
                    Spacer()
                    ScrollView {
                        VStack {
                            Button {
                                viewModal.toggleLessonPage()
                            } label: {
                                Text("\(viewModal.calendarItem.lessonName)")
                                    .font(.custom("DIN Alternate", size: 40))
                                
                                    .frame(width: 380, height: 100)
                                    .background(.ultraThinMaterial)
                                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                            }
                            HStack {
                                Button {
                                    viewModal.toggleLessonPage()
                                } label: {
                                    Text("\(viewModal.calendarItem.lessonID)")                        //Each layout for calenderItems, all different for now
                                        .font(.custom("DIN Alternate", size: 40))
                                        .frame(width: 100, height: 100)
                                        .background(.ultraThinMaterial)
                                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                                        
                                }
                                VStack {
                                    Text("Main Objective:")
                                        .font(.custom("DIN Alternate", size: 20))
                                        
                                    Text("\(viewModal.calendarItem.MainObjective)")
                                        .font(.custom("DIN Alternate", size: 15))
                                }
                                    .frame(width: 275, height: 100)
                                    .background(.ultraThinMaterial)
                                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                                    
                            }
                            HStack {
                                Text("Reading Due: \(viewModal.calendarItem.readingDue)")
                                    .font(.custom("DIN Alternate", size: 20))
                                    .frame(width: 190, height: 100)
                                    .background(.ultraThinMaterial)
                                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                                
                                Text("Assignments Due: \(viewModal.calendarItem.AssignmentsDue)")
                                    .font(.custom("DIN Alternate", size: 20))
                                    .frame(width: 190, height: 100)
                                    .background(.ultraThinMaterial)
                                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                            }
                            HStack {
                                Button {
                                    viewModal.toggleAssignmentPage()
                                } label: {
                                    VStack {
                                        Text("New Assignments: ")
                                            .padding()
                                        Text("\(viewModal.calendarItem.newAssignment)")
                                    }
                                            .font(.custom("DIN Alternate", size: 20))
                                            .frame(width: 190, height: 200)
                                            .background(.ultraThinMaterial)
                                            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                                    
                                }
                                VStack {
                                    Text("Daily Code Challenge: ")
                                        .font(.custom("DIN Alternate", size: 20))
                                        .padding()
                                    Text("\(viewModal.calendarItem.codeChallenge)")
                                        .font(.custom("DIN Alternate", size: 20))
                                }
                                    
                                    .frame(width: 190, height: 200)
                                    .background(.ultraThinMaterial)
                                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                            }
                            HStack {
                                Text("Word of the Day: \(viewModal.calendarItem.wordOfTheDay)")
                                    .font(.custom("DIN Alternate", size: 20))
                                    .frame(width: 380, height: 100)
                                    .background(.ultraThinMaterial)
                                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                            }
                            Button{
                                viewModal.toggleReviewView()
                            } label: {
                                Text("Submit Feedack")
                                    .font(.custom("DIN Alternate", size: 20))
                                    .frame(width: 380, height: 100)
                                    .background(.ultraThinMaterial)
                                    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                            }
                        }
                        .sheet(isPresented: $viewModal.reviewView) {
                            ReviewView()
                        }
                    }
                    .scrollContentBackground(.hidden)
                }
            }
            .navigationDestination(isPresented: $viewModal.lessonPage) {// when you press lesson id you get taken to lesson outline view
                LessonOutlineview(calendarItems: viewModal.calendarItem)
            }
            .navigationDestination(isPresented: $viewModal.assignmentPage) {// when  new assignment is pressed you are taken to assignment outline
                AssignmentOutline(calendarItem: viewModal.calendarItem)
            }
        }
    }
}

//#Preview {
//    // Provide a sample modal for preview purposes
//    TodaysView()
//}



//if you click asssignment name or lesson id a sheet should pop up showing assignment

//need to add a button complete assignment

//Need to add a review button, in assignment outline. "What went well in today's lesson?" "What are you still confused about?" "What suggestions for activities or changes to the lesson do you have?"

// A sumbmit button that closes the page 










