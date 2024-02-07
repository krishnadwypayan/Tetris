//
//  GameState.swift
//  Tetris
//
//  Created by krishna dwypayan on 07/02/24.
//

import SwiftUI


let rows: Int = 20
let cols: Int = 10

class GameState: ObservableObject {
    @Published var gameState: [[Color]] = [[Color]](repeating: [Color](repeating: .primary, count: cols), count: rows)
    
    func reset() {
        gameState = [[Color]](repeating: [Color](repeating: .primary, count: cols), count: rows)
    }
    
    /**
     Controls the functionality of tetrominoes falling down from top of the screen.
     
     1. Select random tetrominoe to fall from (0, cols/2)
     2. Get the coordinates of the board that need to be coloured with the tetrominoe colour
     3. Change gameState cells colours
     */
    func fallDown() {
        let tetrominoe = getRandomTetrominoe()
        let cells = getColouredCells(tet: tetrominoe, x: 0, y: 0)
        changeGameStateCellColours(cells: cells, color: tetrominoe.color)
        
//        print(tetrominoe.config, tetrominoe.color)
//        print(cells)
//        print(gameState)
    }
    
    func getColouredCells(tet: Tetrominoe, x: Int, y: Int) -> [[Int]] {
        var cells: [[Int]] = []
        
        for i in 0..<tet.config.count {
            for j in 0..<tet.config[i].count {
                if tet.config[i][j] == 1 {
                    cells.append([i, j + cols/2 - 1])
                }
            }
        }
        
        return cells
    }
    
    func changeGameStateCellColours(cells: [[Int]], color: Color) {
        for row in cells {
            gameState[row[0]][row[1]] = color
        }
    }
}
