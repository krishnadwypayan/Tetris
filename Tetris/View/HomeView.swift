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
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            NavigationLink(destination: GameView()) {
                Text("New Game")
                    .font(.title3).bold()
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            
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
