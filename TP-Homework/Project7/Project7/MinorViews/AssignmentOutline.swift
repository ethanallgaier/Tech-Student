//
//  AssignmentOutline.swift
//  Project7
//
//  Created by Ethan Allgaier on 11/12/25.
//

import SwiftUI

struct AssignmentOutline: View {
    var calendarItem: CalendarItems
    @State var assignmentComplete = false
    var body: some View {
        Text("\(calendarItem.newAssignment)")
        
        
        HStack{
            Text("Complete?")
        Button(action: { assignmentComplete.toggle()
        }) {//Button for completeing an assignment
            Image(systemName: assignmentComplete ? "checkmark.circle.fill" : "circle")
                         .font(.system(size: 40))
                    .foregroundColor(assignmentComplete ? .green : .gray)
                    .animation(.easeInOut(duration: 0.2), value: assignmentComplete)
            }
        }
    }
}






#Preview {
    AssignmentOutline(calendarItem: sampleCalendarItems.first!)
}
