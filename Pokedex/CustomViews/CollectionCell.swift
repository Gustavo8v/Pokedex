//
//  CollectionCell.swift
//  Pokedex
//
//  Created by Gustavo Gutierrez on 05/01/25.
//

import SwiftUI

struct CollectionCell: View {
    
    var text: String
    var withRandomColor: Bool
    
    var body: some View {
        Text(text)
            .padding()
            .foregroundColor(withRandomColor ? .white : .black)
            .background(withRandomColor ? assignRandomColor() : .white)
            .multilineTextAlignment(.center)
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(withRandomColor ? Color.white : Color.gray,
                            lineWidth: 2)
            )
    }
    
    private func assignRandomColor() -> Color {
        Color(
            red: Double.random(in: 0.0...1.0),
            green: Double.random(in: 0.0...1.0),
            blue: Double.random(in: 0.0...1.0)
        )
    }}

#Preview {
    CollectionCell(text: "Water", withRandomColor: false)
}
