//
//  GameView.swift
//  Tetris
//
//  Created by krishna dwypayan on 31/01/24.
//

import SwiftUI

struct GameView: View {

    @StateObject var gameState = GameState()
    @Binding var newGame: Bool

    var body: some View {
        VStack {
            
            NextTetrominoeView(gameState: gameState)
                .padding()

            GameBoardView(gameState: gameState)
            
            GameControllerView()
                .padding()

        }
        .padding()
        .onAppear {
            if newGame {
                gameState.reset()
                newGame = false
            }
            
            gameState.fallDown()
        }
        .alert("Game Over!", isPresented: $gameState.gameOver) {
            Button("Restart", role: .cancel) {
                gameState.reset()
                gameState.fallDown()
            }
        }
    }
}

#Preview {
    GameView(newGame: .constant(false))
}
