//
//  AsynPokemonImage.swift
//  Pokedex
//
//  Created by Gustavo Gutierrez on 04/01/25.
//

import SwiftUI

struct AsynPokemonImage: View {
    
    let idPokemon: String
    private let urlPokemonBase: String = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
    private var urlPokemon: String
    
    init(idPokemon: String) {
        self.idPokemon = idPokemon
        urlPokemon = "\(urlPokemonBase)/\(idPokemon).png"
    }
    
    init(urlPokemon: String) {
        self.idPokemon = ""
        self.urlPokemon = urlPokemon
    }
    
    var body: some View {
        AsyncImage(url: URL(string: urlPokemon)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                case .failure:
                    Image("whoThatPokemon")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.red)
                @unknown default:
                    EmptyView()
                }
            }
        }
}

#Preview {
    AsynPokemonImage(idPokemon: "1")
}
