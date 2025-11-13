//
//  ContentView.swift
//  LifecycleLab
//
//  Created by Ethan Allgaier on 10/22/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.scenePhase) var scenephase
    @State var events: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    DetailView()
                } label: {
                    Text(events)
                }
            }
            .onAppear {
                print("ContentView appeared!")
                events.append("ContentView appeared!")
            }
            
            .onDisappear {
                print("ContentView disappeared!")
                events.append("ContentView disappeared!")
            }
            .onChange(of: scenephase) {
                events.append("Scene Phase is: \(scenephase)!")
            }
            
            
        }
    }
}

struct DetailView: View {
    var body: some View {
        VStack {
            Text("Second View")
        }
        .onAppear {
            print("DetailView appeared!")
        }
        .onDisappear {
            print("DetailView disappeared!")
        }
    }
}






#Preview {
    ContentView()
}
