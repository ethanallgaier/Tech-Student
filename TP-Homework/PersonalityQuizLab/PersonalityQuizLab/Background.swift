//
//  Background.swift
//  PersonalityQuizLab
//
//  Created by Ethan Allgaier on 10/23/25.
//

import SwiftUI

struct SmoothBackground: View {
    @State private var animate = false
    let blobs = 5
    
    var body: some View {
        ZStack {
            Color.colorWhite.opacity(0.8).ignoresSafeArea()
            
            ForEach(0..<blobs, id: \.self) { i in
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [Color.blueMe.opacity(0.8), Color.blue.opacity(0.5)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: CGFloat(400 + i * 25), height: CGFloat(200 + i * 50))
                    .blur(radius: 80)
                    .offset(x: animate ? CGFloat(i * 30) : CGFloat(-i * 30),
                            y: animate ? CGFloat(i * 50) : CGFloat(-i * 50))
                    .animation(
                        Animation.easeInOut(duration: Double(6 + i*2))
                            .repeatForever(autoreverses: true),
                        value: animate
                    )
            }
        }
        .onAppear {
            animate.toggle()
        }
    }
}

