//
//  GameBoardView.swift
//  Tetris
//
//  Created by krishna dwypayan on 31/01/24.
//

import SwiftUI

// TODO Define squareSize based on screenSize
let boardCellSquareSize: CGFloat = 30
let squareRadius: CGFloat = 2
let rows: Int = 20
let cols: Int = 10

struct GameBoardView: View {
    var body: some View {

        VStack(spacing: 0) {
            ForEach(0..<rows, id: \.self) { i in
                GameRow()
            }
        }
        .overlay {
            RoundedRectangle(cornerRadius: squareRadius)
                .stroke(.primary)
        }
    }
}

struct GameRow: View {
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<cols, id: \.self) { i in
                Cell(size: boardCellSquareSize)
            }
        }
    }
}

struct Cell: View {
    
    var size: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: squareRadius)
            .stroke(.primary.opacity(0.1), lineWidth: 1)
            .frame(width: size, height: size, alignment: .center)
    }
}

#Preview {
    GameBoardView()
}
