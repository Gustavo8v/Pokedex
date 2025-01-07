//
//  PokemonDetail.swift
//  Pokedex
//
//  Created by Gustavo Gutierrez on 04/01/25.
//

import Foundation

struct PokemonDetail: Codable, Hashable {
    var name: String?
    var order: Int?
    var id: Int?
    var sprites: PokemonSprites?
    var types: [PokemonTypes]?
    var stats: [StatsPokemons]?
}

struct PokemonSprites: Codable, Hashable {
    var frontDefault: String?
    var frontShiny: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
    }
}

struct PokemonTypes: Codable, Hashable {
    var type: Types?
}

struct Types: Codable, Hashable {
    var name: String?
}

struct StatsPokemons: Codable, Hashable {
    var baseStat: Int?
    var effort: Int?
    var stat: Stat?
    
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort
        case stat
    }
}

struct Stat: Codable, Hashable {
    var name: String?
    var url: String?
}
