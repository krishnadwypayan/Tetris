//
//  GameState.swift
//  Tetris
//
//  Created by krishna dwypayan on 07/02/24.
//

import SwiftUI


let rows: Int = 20
let cols: Int = 10

let nextTetroRows = 4
let nextTetroCols = 4

class GameState: ObservableObject {
    
    @Published var nextTetrominoeState: [[Color]] = [[Color]](repeating: [Color](repeating: .primary, count: nextTetroCols), count: nextTetroRows)
    
    @Published var gameState: [[Color]] = [[Color]](repeating: [Color](repeating: .primary, count: cols), count: rows)
    @Published var gameOver: Bool = false
    @Published var x = 0
    @Published var y = cols/2 - 1
    var prevTetrominoeCells: [[Int]] = []

    
    func reset() {
        gameOver = false
        gameState = [[Color]](repeating: [Color](repeating: .primary, count: cols), count: rows)
        prevTetrominoeCells = []
        x = 0
        y = cols/2 - 1
        
        nextTetrominoeState = [[Color]](repeating: [Color](repeating: .primary, count: nextTetroCols), count: nextTetroRows)
    }
    
    /**
     Controls the functionality of tetrominoes falling down from top of the screen.
     
     1. Select random tetrominoe to fall from (0, cols/2 - 1)
     2. while bottom bound is not reached
        2.1 Get the coordinates of the board that need to be coloured with the tetrominoe colour
        2.2 Change gameState cells colours
        2.3 Reset previous state colours
     3. If bottom is hit, save current state and reset prev state
     */
    func fallDown() {
        var tetrominoe = getRandomTetrominoe()
        var currentTetrominoeCells = getColouredCellsForTetrominoe(tet: tetrominoe, x: x, y: y)
        var nextTetrominoeCells = self.getColouredCellsForTetrominoe(tet: tetrominoe, x: 0, y: 1)

        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            self.changeNextTetrominoeState(currentTetrominoeCells: nextTetrominoeCells, color: tetrominoe.color)
            
            if !self.isBottomHit(currentTetrominoeCells: currentTetrominoeCells) {
                self.changeGameStateForTetrominoe(currentTetrominoeCells: currentTetrominoeCells, color: tetrominoe.color)
                self.x += 1
                currentTetrominoeCells = self.getColouredCellsForTetrominoe(tet: tetrominoe, x: self.x, y: self.y)
            } else {
                if self.isGameOver(currentTetrominoeCells: currentTetrominoeCells) {
                    self.gameOver = true
                    timer.invalidate()
                } else {
                    // reset for the next tetrominoe to start falling down
                    self.prevTetrominoeCells = []
                    self.x = 0
                    self.y = cols/2 - 1
                    tetrominoe = getRandomTetrominoe()
                    currentTetrominoeCells = self.getColouredCellsForTetrominoe(tet: tetrominoe, x: self.x, y: self.y)
                    nextTetrominoeCells = self.getColouredCellsForTetrominoe(tet: tetrominoe, x: 0, y: 1)
                }
            }
        }
    }

    /**
     Return true if the top of currentTetrominoe is touching the top of the screen
     */
    func isGameOver(currentTetrominoeCells: [[Int]]) -> Bool {
        return !currentTetrominoeCells.filter { row in return row[0] == 0 }.isEmpty
    }
    
    func isBottomHit(currentTetrominoeCells: [[Int]]) -> Bool {
        // pick last row entry having unique col
        var map: [Int:Int] = [:]
        for row in currentTetrominoeCells {
            if !map.keys.contains(row[1]) || map[row[1]]! < row[0] {
                map[row[1]] = row[0]
            }
        }
        
        for entry in map {
            if entry.value >= rows || gameState[entry.value][entry.key] != .primary {
                return true
            }
        }
        return false
    }
    
    func getColouredCellsForTetrominoe(tet: Tetrominoe, x: Int, y: Int) -> [[Int]] {
        var cells: [[Int]] = []
        
        for i in 0..<tet.config.count {
            for j in 0..<tet.config[i].count {
                if tet.config[i][j] == 1 {
                    cells.append([i + x, j + y])
                }
            }
        }
        
        return cells
    }

    /**
     Changes game state based on which cells to be colored for current tetrmoninoe.
     1. Set current tetrmonioe cells with right colors
     2. Reset prevTetrominoeCells and copy current tetrominoe to prevTetrominorCells
     */
    func changeGameStateForTetrominoe(currentTetrominoeCells: [[Int]], color: Color) {
        for row in prevTetrominoeCells {
            gameState[row[0]][row[1]] = .primary
        }
        for row in currentTetrominoeCells {
            gameState[row[0]][row[1]] = color
        }
        prevTetrominoeCells = currentTetrominoeCells
    }
    
    func changeNextTetrominoeState(currentTetrominoeCells: [[Int]], color: Color) {
        nextTetrominoeState = [[Color]](repeating: [Color](repeating: .primary, count: nextTetroCols), count: nextTetroRows)
        for row in currentTetrominoeCells {
            nextTetrominoeState[row[0]][row[1]] = color
        }
    }
}
