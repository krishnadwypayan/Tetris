//
//  NextTetriminoeView.swift
//  Tetris
//
//  Created by krishna dwypayan on 01/02/24.
//

import SwiftUI

// TODO Define squareSize based on screenSize
var nextTetriCellSquareSize: CGFloat = 15

struct NextTetriminoeView: View {
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<4, id: \.self) { i in
                row
            }
        }
        .overlay {
            RoundedRectangle(cornerRadius: squareRadius)
                .stroke(.primary)
        }
    }
    
    var row = HStack(spacing: 0) {
        ForEach(0..<4, id: \.self) { i in
            Cell(size: nextTetriCellSquareSize)
        }
    }
}

#Preview {
    NextTetriminoeView()
}
