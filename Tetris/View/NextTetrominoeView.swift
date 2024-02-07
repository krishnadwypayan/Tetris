//
//  NextTetriminoeView.swift
//  Tetris
//
//  Created by krishna dwypayan on 01/02/24.
//

import SwiftUI


var nextTetroCellSquareSize: CGFloat = boardCellSquareSize/2

struct NextTetrominoeView: View {
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
            Cell(size: nextTetroCellSquareSize)
        }
    }
}

#Preview {
    NextTetrominoeView()
}
