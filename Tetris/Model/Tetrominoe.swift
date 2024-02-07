//
//  Tetrominoe.swift
//  Tetris
//
//  Created by krishna dwypayan on 04/02/24.
//

import SwiftUI


class Tetrominoe {
    var config: [[Int]]
    var color: Color
    
    init(config: [[Int]], color: Color) {
        self.config = config
        self.color = color
    }
}

let tetro1 = Tetrominoe(config: [[1], [1], [1], [1]], color: .purple)
let tetro2 = Tetrominoe(config: [[0, 1], [0, 1], [1, 1]], color: .indigo)
let tetro3 = Tetrominoe(config: [[1, 0], [1, 0], [1, 1]], color: .blue)
let tetro4 = Tetrominoe(config: [[1, 1], [1, 1]], color: .green)
let tetro5 = Tetrominoe(config: [[0, 1, 1], [1, 1, 0]], color: .yellow)
let tetro6 = Tetrominoe(config: [[1, 1, 1], [0, 1, 0]], color: .orange)
let tetro7 = Tetrominoe(config: [[1, 1, 0], [0, 1, 1]], color: .red)

let tetrominoes: [Tetrominoe] = [tetro1, tetro2, tetro3, tetro4, tetro5, tetro6, tetro7]


func getRandomTetrominoe() -> Tetrominoe {
    return tetrominoes.randomElement() ?? tetrominoes[0]
}
