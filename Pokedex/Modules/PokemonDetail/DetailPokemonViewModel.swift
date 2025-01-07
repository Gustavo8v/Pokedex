//
//  DetailPokemonViewModel.swift
//  Pokedex
//
//  Created by Gustavo Gutierrez on 04/01/25.
//

import Foundation

class DetailPokemonViewModel: DetailPokemonViewModelProtocol {
    
    @Published var pokemon: PokemonDetail
    
    init(pokemon: PokemonDetail) {
        self.pokemon = pokemon
    }
}
