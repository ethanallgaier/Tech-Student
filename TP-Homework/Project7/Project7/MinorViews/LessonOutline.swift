//
//  AssignmentOutlineview.swift
//  Project7
//
//  Created by Ethan Allgaier on 11/12/25.
//

import SwiftUI

struct LessonOutlineview: View {
    var calendarItems: CalendarItems
    var body: some View {
        
        Text("Lesson Outline")
        
        Text("\(calendarItems.lessonName)")
        
        
    }
}





#Preview {
    LessonOutlineview(calendarItems: sampleCalendarItems.first!)
}
