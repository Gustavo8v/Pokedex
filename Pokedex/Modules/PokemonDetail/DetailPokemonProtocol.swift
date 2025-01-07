//
//  DetailPokemonProtocol.swift
//  Pokedex
//
//  Created by Gustavo Gutierrez on 04/01/25.
//

import Foundation

protocol DetailPokemonViewModelProtocol: ObservableObject {
    
    var pokemon: PokemonDetail { get set }
}
