//
//  GameView.swift
//  Tetris
//
//  Created by krishna dwypayan on 31/01/24.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        VStack {
            
            NextTetriminoeView()
                .padding()

            GameBoardView()
            
            GameControllerView()
                .padding()

        }
        .padding()
    }
}

#Preview {
    GameView()
}
