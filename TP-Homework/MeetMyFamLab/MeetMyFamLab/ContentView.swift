//
//  ContentView.swift
//  MeetMyFamilyLab!
//
//  Created by Ethan Allgaier on 10/10/25.
//

import SwiftUI

struct ProfileView: View {
    @State var imageName: String
    @State var title: String
    @State var background: Color
    @Binding var showModal: Bool
    let modalContent: AnyView
    
    @State private var viewedModal: Bool = false 

    var body: some View {
        Button {
            showModal = true
        } label: {
            HStack(spacing: 20) {
                Image(systemName: "info.circle")
                    .foregroundColor(.niceBlue)
                
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 75, height: 75)
                    .clipShape(Circle())
                    .shadow(radius: 3)
                
                HStack {
                    Text(title)
                        .foregroundColor(.melon)
                        .font(.custom("Impact", size: 30))
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                    
                    
                    if viewedModal {
                        Image(systemName: "checkmark.diamond")
                            .foregroundColor(.white)
                            .font(.custom("Impact", size: 18))
                            
                    }
                }
                .padding()
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .frame(width: 375, height: 100)
            .glassEffect(.clear)
            .cornerRadius(40)
        }
        .sheet(isPresented: $showModal, onDismiss: {
            viewedModal = true
        }) {
            modalContent
        }
    }
}


struct ContentView: View {
    @State var showModalDad: Bool = false
    @State var showModalMom: Bool = false
    @State var showModalRyan: Bool = false
    @State var showModalAlex: Bool = false
    @State var showModalSeth: Bool = false
    @State var showModalTyson: Bool = false
    @State var showModalMe: Bool = false
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                SmoothBackground()
                
                ScrollView {
                    VStack(spacing: 10 ) {
                        Text("Meet My Family")
                            .font(.custom("impact", fixedSize: 55))
                            .foregroundColor(.melon)
                            .underline()
                            .padding(.top, 20,)
                            .padding(.bottom, 40)
                        
                        
                        ProfileView(imageName: "ryan",
                                    title: "Geralyn",
                                    background: .black,
                                    showModal: $showModalMom,
                                    modalContent: AnyView(momView())
                        )
                        ProfileView(imageName: "dadPic",
                                    title: "Andrew",
                                    background: .black,
                                    showModal: $showModalDad,
                                    modalContent: AnyView(dadView())
                        )
                        ProfileView(imageName: "tysonPic",
                                    title: "Tyson",
                                    background: .black,
                                    showModal: $showModalTyson,
                                    modalContent: AnyView(tyView())
                        )
                        ProfileView(imageName: "sethPic",
                                    title: "Seth",
                                    background: .black,
                                    showModal: $showModalSeth,
                                    modalContent: AnyView(sethView())
                        )
                        ProfileView(imageName: "mePic",
                                    title: "Ethan",
                                    background: .black,
                                    showModal: $showModalMe,
                                    modalContent: AnyView(meView())
                        )
                        ProfileView(imageName: "alexPic",
                                    title: "Alex",
                                    background: .black,
                                    showModal: $showModalAlex,
                                    modalContent: AnyView(alexView())
                        )
                        ProfileView(imageName: "ryan",
                                    title: "Ryan",
                                    background: .black,
                                    showModal: $showModalRyan,
                                    modalContent: AnyView(ryanView())
                        )
                    }
                    
                }
            }
            
            
        }
    }
}



struct SmoothBackground: View {
    @State private var animate = false
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.9).ignoresSafeArea() // dark canvas

            // Soft moving blobs
            ForEach(0..<5) { i in
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.melon.opacity(0.2), .red.opacity(0.8)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: CGFloat(400 + i * 25), height: CGFloat(200 + i * 50))
                    .blur(radius: 80)
                    .offset(x: animate ? CGFloat.random(in: -150...150) : CGFloat.random(in: -200...200),
                            y: animate ? CGFloat.random(in: -150...150) : CGFloat.random(in: -200...200))
                    .animation(
                        Animation.easeInOut(duration: Double.random(in: 6...12))
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

struct infoView: View {
    
    @State var name: String
    @State var age: Int
    @State var funFact: String
    @State var funFact2: String
    @State var coolness: String
    @State var image: String
    
    var body: some View {
        ZStack {
            SmoothBackground()
            VStack {
                Text("About \(name)")
                    .font(.custom("impact", fixedSize: 55))
                    .foregroundColor(.white)
                    .underline()
                    .padding(.bottom)
                Text("Age: \(age)")
                    .font(.custom("impact", fixedSize: 20))
                    .padding()
                    .foregroundColor(.white)
                
                Text("\(funFact)")
                    .font(.custom("impact", fixedSize: 20))
                    .padding()
                    .foregroundColor(.white)
                
                Text("\(funFact2)")
                    .font(.custom("impact", fixedSize: 20))
                    .padding()
                    .foregroundColor(.white)
                
                Text("Coolness: \(coolness)")
                    .font(.custom("impact", fixedSize: 20))
                    .padding()
                    .foregroundColor(.white)
                    .padding()
                Image(systemName: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 200)
                    .shadow(radius: 20)
                    .offset(x: 0, y: 75)
                
            }
            
        }
    }
}

struct ryanView: View {
    var body: some View {
        VStack {
            
            infoView(name: "Ryan",
                     age: 16,
                     funFact: "Ryan is in highschool.",
                     funFact2: "He loves to play the piano and is very good.",
                     coolness: "This is guy is pretty cool.",
                     image: "figure.handball")
        }
    }
}


struct alexView: View {
    var body: some View {
        VStack {
            infoView(name: "Alex",
                     age: 18,
                     funFact: "Alex loves hiking.",
                     funFact2: "Just graduated from highschool.",
                     coolness: "Yeah pretty cool dude.",
                     image: "figure.bowling")
        }
    }
}
struct sethView: View {
    var body: some View {
        VStack {
            infoView(name: "Seth",
                     age: 22,
                     funFact: "Seth went on a mission to texas.",
                     funFact2: "Seth is actully batman",
                     coolness: "Cool yeah.",
                     image: "figure.hiking")
        }
    }
}

struct dadView: View {
    var body: some View {
        VStack {
            infoView(name: "My Dad",
                     age: 47,
                     funFact: "My dad used to be really good at skating.",
                     funFact2: "Owns a company called Cambio. ",
                     coolness: "Cool for sure.",
                     image: "figure.skateboarding")
        }
    }
}
struct momView: View {
    var body: some View {
        VStack {
            infoView(name: "My Mom",
                     age: 47,
                     funFact: "My mom is a really good designer.",
                     funFact2: "She is an amazing mom.",
                     coolness: "Coolest person.",
                     image: "figure.taichi")
        }
    }
}
struct meView: View {
    var body: some View {
        VStack {
            infoView(name: "Me",
                     age: 20,
                     funFact: "I love playing the guitar.",
                     funFact2: "I have a cat named Tito.",
                     coolness: "I would hope so.",
                     image: "figure.snowboarding")
        }
    }
}
struct tyView: View {
    var body: some View {
        VStack {
            infoView(name: "Tyson",
                     age: 24,
                     funFact: "Tyson is a graphic designer at uvu.",
                     funFact2: "loves listening to music and making playlists.",
                     coolness: "Cool",
                     image: "figure.mind.and.body")
        }
    }
}




#Preview {
    ContentView()
}



#Preview {
    ryanView()
}
