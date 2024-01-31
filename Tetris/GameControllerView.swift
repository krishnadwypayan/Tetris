//
//  GameControllerView.swift
//  Tetris
//
//  Created by krishna dwypayan on 01/02/24.
//

import SwiftUI

let clockwise = "arrow.clockwise"
let left = "chevron.left"
let right = "chevron.right"
let down = "chevron.down"

struct GameControllerView: View {
    var body: some View {
        HStack(spacing: 40) {
            // Rotate tetrominoes button
            ControllerButton(icon: clockwise)
            
            Spacer()
            
            // left
            ControllerButton(icon: left)
            
            // down
            ControllerButton(icon: down)
            
            // right
            ControllerButton(icon: right)
        }
        .padding()
    }
}

struct ControllerButton: View {
    var icon: String
    
    var body: some View {
        
        Button(action: {}, label: {
            Image(systemName: icon)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.primary)
                        .frame(width: 40, height: 40)
                }
        })
    }
}

#Preview {
    GameControllerView()
}
