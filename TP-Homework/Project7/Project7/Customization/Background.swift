//
//  Background.swift
//  Project7
//
//  Created by Ethan Allgaier on 11/11/25.
//

import SwiftUI


struct AnimatedBackground: View {
    @State private var moveGradient = false
    
    var body: some View {
        ZStack {
            // Base dark gradient — dark but not black
            LinearGradient(
                colors: [
                    Color(red: 0.4, green: 0.1, blue: 0.12),
                    Color(red: 0.08, green: 0.08, blue: 0.1)
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            // Soft color clouds that move slowly
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.white.opacity(0.8),
                    Color.blue.opacity(0.25),
                    Color.cyan.opacity(0.3)
                ]),
                startPoint: moveGradient ? .bottomLeading : .bottomTrailing,
                endPoint: moveGradient ? .bottomTrailing : .topLeading
            )
            .animation(
                .easeInOut(duration: 20)
                .repeatForever(autoreverses: true),
                value: moveGradient
            )
            .ignoresSafeArea()
            
            // Subtle dark overlay to keep contrast balanced
            Color.black.opacity(0.25)
                .ignoresSafeArea()
        }
        .onAppear {
            moveGradient.toggle()
        }
    }
}

#Preview {
    AnimatedBackground()
        .preferredColorScheme(.dark)
}

