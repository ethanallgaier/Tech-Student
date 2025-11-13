//
//  CalenderView.swift
//  Project7
//
//  Created by Ethan Allgaier on 11/10/25.
//



//This is what you see, adding title, blueprint and data to it.
import SwiftUI

struct CalenderView: View {
    //Alowing me to get information from calendarItems and sample items
    let calendarItem: [CalendarItems] = sampleCalendarItems
    
    
    //selectedDay = what calender item you selected will change todays view to that day
    @State private var selectedDay: CalendarItems? = nil

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()

            VStack {
                Text("Calender")
                    .foregroundColor(.black)
                    .font(.custom("DIN Alternate", size: 70))
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)

                ScrollView {
                    VStack {
                        //for each sample calendarItems, it will place each sample item into the blueprint i have.
                        ForEach(calendarItem) { item in
                            CalenderEntryView(
                                item: item,
                                onSelect: { selectedDay = item }
                            )
                        }
                    }
                }
            }
        }
        //This allows todays view to pop up in a .sheet and show the selected day
        .sheet(item: $selectedDay) { selected in
            TodaysView(viewModal: .constant(TodaysViewModal(calendarItem: selected)))
        }

    }
}






//---------------------------------------------------------------------------------





//This is my layout design for each of the calender items
struct CalenderEntryView: View {
    let item: CalendarItems
    let onSelect: () -> Void

    var body: some View {
        Button {
            onSelect()
        } label: {
            HStack(spacing: 20) {
                VStack {
                    Text("\(item.lessonID)")
                        .foregroundColor(.black)
                        .font(.custom("DIN Alternate", size: 30))
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .padding()
                    
                    Text(item.lessonName)
                        .foregroundColor(.black)
                        .font(.custom("DIN Alternate", size: 30))
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                }
                Divider()
                    .frame(height: 135)
                    .background(Color.gray)
                    .padding(.vertical)

                Text(item.AssignmentsDue)
                    .foregroundColor(.black)
                    .font(.custom("DIN Alternate", size: 30))
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }
            .frame(width: 375, height: 200)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            
        }
    }
}

            
           



























#Preview {
    CalenderView()
}
