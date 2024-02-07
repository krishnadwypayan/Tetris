//
//  GameBoardView.swift
//  Tetris
//
//  Created by krishna dwypayan on 31/01/24.
//

import SwiftUI


// Define squareSize based on screenSize
// boardCellSquareSize = minimum of (screen height/width) divided by (no.of rows/cols + x)
// where x is the additional space to be left outside the board in terms of cells
let boardCellSquareSize: CGFloat = min(UIScreen.main.bounds.height/((CGFloat)(rows + 8)), UIScreen.main.bounds.width/((CGFloat)(cols + 2)))

let squareRadius: CGFloat = 2

struct GameBoardView: View {
    
    @ObservedObject var gameState: GameState
    
    var body: some View {

        VStack(spacing: 0) {
            ForEach(0..<rows, id: \.self) { i in
                GameRow(row: gameState.gameState[i])
            }
        }
        .overlay {
            RoundedRectangle(cornerRadius: squareRadius)
                .stroke(.primary)
        }
    }
}

struct GameRow: View {
    var row: [Color]
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<cols, id: \.self) { i in
                Cell(size: boardCellSquareSize, color: row[i])
            }
        }
    }
}

struct Cell: View {
    
    var size: CGFloat
    @Environment(\.colorScheme) var colorScheme
    var color: Color = .primary
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: squareRadius)
                .fill(isColored() ? color : getDefaultBgColor())
                .stroke(isColored() ? color : getDefaultStrokeColor(), lineWidth: 1)
            
            if isColored() {
                RoundedRectangle(cornerRadius: squareRadius)
                    .stroke(Color.white.opacity(0.6), lineWidth: 1)
                    .blur(radius: 1)
                    .offset(x: 1, y: 1)
                
                RoundedRectangle(cornerRadius: squareRadius)
                    .stroke(Color.black.opacity(0.3), lineWidth: 1)
                    .blur(radius: 1)
                    .offset(x: -1, y: -1)
            }
        }
        .frame(width: size, height: size, alignment: .center)
    }
    
    func isColored() -> Bool {
        return color != .primary
    }
    
    func getDefaultBgColor() -> Color {
        return colorScheme == .dark ? Color.black.opacity(0.5) : Color.white
    }
    
    func getDefaultStrokeColor() -> Color {
        return colorScheme == .dark ? Color.white.opacity(0.1) : Color.black.opacity(0.1)
    }
}

#Preview {
    GameBoardView(gameState: GameState())
}
