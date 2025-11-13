//
//  ContentView.swift
//  Project7
//
//  Created by Ethan Allgaier on 11/9/25.
//

import SwiftUI

//This is my Tab view making it able to switch to todays view to calender view quickly from the bottom of the screen

struct RootTabView: View {
    
   //I need this for TodaysViewModal
    @State private var todaysViewModal: TodaysViewModal = TodaysViewModal(calendarItem: sampleCalendarItems.first!)
  
    var body: some View {
        SwiftUI.TabView {
            TodaysView(viewModal: $todaysViewModal )
                .tabItem {
                    Label("Today", systemImage: "calendar.and.person")
                }
            CalenderView()
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
            }
        }
    }
}
#Preview {
    RootTabView()
}
