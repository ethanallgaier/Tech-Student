//
//  ContentView.swift
//  List + Forms lab
//
//  Created by Ethan Allgaier on 10/7/25.
//

import SwiftUI







import SwiftUI

struct ViewForLists: View {
    @State private var songs = [
        ("Creep", "Radiohead", "2:30"),
        ("Rust", "Black Label", "3:59"),
        ("Tyler", "Joji", "1:09"),
        ("You", "RadioHead", "2:09")
    ]
    
    var body: some View {
        
        
        List {
            ForEach(songs, id: \.0) { song, artist, time in
                VStack(alignment: .leading) {
                    Text(artist)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        
                    Text(song)
                            .font(.headline)
                    ZStack {
                        Text(time)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
            }
            
            
        }
    }
}
    
    
#Preview {
    ViewForLists()
}

struct ViewForForms: View {
    @State var name = ""
    @State private var password = ""
    var ages = ["18-", "19", "20", "21+"]
    @State var selectedAge = "19"
    @State var sound = true
    @State var coolness: Double = 5.0
    @State var numberOfFriends = 0
    
    var body: some View {
        
        Form {
            Section(header: Text("User Info")) {
                TextField("Enter Name", text: $name)
                
                SecureField("Enter Password", text: $password)
                
                
                Picker("Current Age", selection: $selectedAge) {
                    ForEach(ages, id: \.self) { age in
                        Text(age)
                    }
                }
                
            }
            .pickerStyle(.menu)
            
            Section(header: Text("More Cool Info")) {
                Toggle("Play notication sounds", isOn: $sound)
                // How do i something on each side of the slider?
                HStack {
                    Image(systemName: "checkmark")
                    Slider(value: $coolness, in: 0...10.0)
                    Image(systemName: "checkmark")
                }
                Stepper("Number of Friends: \(numberOfFriends)", value: $numberOfFriends, in: 1...10)
            }
        }
    }
    
}



#Preview {
    ViewForForms()
}
