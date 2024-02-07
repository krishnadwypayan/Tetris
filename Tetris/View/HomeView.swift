//
//  WelcomeView.swift
//  Tetris
//
//  Created by krishna dwypayan on 31/01/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                NameView()
                Spacer()
                MenuView()
                Spacer()
            }.padding()
        }
    }
}

struct NameView: View {
    var body: some View {
        HStack {
            Text("TETRIS")
                .font(.system(size: 60, weight: .bold, design: .rounded))
                .multilineTextAlignment(.center)
                .foregroundStyle(
                    LinearGradient(
                        colors: [.purple, .indigo, .blue, .green, .yellow, .orange, .red], startPoint: .leading, endPoint: .trailing
                        )
                    )
                .shadow(radius: 3)
        }
    }
}

struct MenuView: View {
    
    @State private var newGame: Bool = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Group {
                if !newGame {
                    NavigationLink(destination: GameView(newGame: $newGame)) {
                        Text("Continue")
                            .font(.title3).bold()
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.large)
                }
            }
            
            NavigationLink(destination: GameView(newGame: $newGame)) {
                Text("New Game")
                    .font(.title3).bold()
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .onTapGesture {
                newGame = true
            }
            
            Button {
                // Implement
            } label: {
                Text("High Scores")
                    .font(.title3).bold()
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
            
            Button {
                // Implement
            } label: {
                Text("Menu")
                    .font(.title3).bold()
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
