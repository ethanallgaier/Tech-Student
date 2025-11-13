//
//  todaysViewModal.swift
//  Project7
//
//  Created by Ethan Allgaier on 11/12/25.
//

import SwiftUI
//this is the data that allows me to go to different views 
@Observable
class TodaysViewModal {
     var calendarItem: CalendarItems
     var lessonPage = false
     var assignmentPage = false
     var reviewView = false
    
    init(calendarItem: CalendarItems) {
            self.calendarItem = calendarItem
        }
        
        func toggleLessonPage() { lessonPage.toggle() }
        func toggleAssignmentPage() { assignmentPage.toggle() }
        func toggleReviewView() { reviewView.toggle() }
    
}

