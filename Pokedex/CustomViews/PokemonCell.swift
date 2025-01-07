//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Gustavo Gutierrez on 04/01/25.
//

import SwiftUI

struct PokemonCell: View {
    
    let name: String
    let idPokemon: String
    
    var body: some View {
        HStack {
            AsynPokemonImage(idPokemon: idPokemon)
                .frame(maxWidth: 50, maxHeight: 50)
            Text(name)
                .font(.system(size: 20).bold())
            Spacer()
        }
        .cornerRadius(10)
    }
}

#Preview {
    PokemonCell(name: "Pikachu", idPokemon: "1")
}
