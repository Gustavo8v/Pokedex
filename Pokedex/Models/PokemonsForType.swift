//
//  PokemonsForType.swift
//  Pokedex
//
//  Created by Gustavo Gutierrez on 05/01/25.
//

import Foundation

struct PokemonsForTypeDTO: Codable, Hashable {
    var pokemon: [PokemonsForType]?
}

struct PokemonsForType: Codable, Hashable {
    var pokemon: PokemonsList?
}
