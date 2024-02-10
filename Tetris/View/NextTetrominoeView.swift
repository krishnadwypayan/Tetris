//
//  NextTetriminoeView.swift
//  Tetris
//
//  Created by krishna dwypayan on 01/02/24.
//

import SwiftUI


let nextTetroCellSquareSize: CGFloat = boardCellSquareSize/2

struct NextTetrominoeView: View {
    
    @ObservedObject var gameState: GameState
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<nextTetroRows, id: \.self) { i in
                NextTetroRow(row: gameState.nextTetrominoeState[i])
            }
        }
        .overlay {
            RoundedRectangle(cornerRadius: squareRadius)
                .stroke(.primary)
        }
    }
}

struct NextTetroRow: View {
    var row: [Color]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<nextTetroCols, id: \.self) { i in
                Cell(size: nextTetroCellSquareSize, color: row[i])
            }
        }
    }
}


#Preview {
    NextTetrominoeView(gameState: GameState())
}
