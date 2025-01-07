//
//  Pokemons.swift
//  Pokedex
//
//  Created by Gustavo Gutierrez on 04/01/25.
//

import Foundation

struct Pokemons: Codable {
    var results: [PokemonsList]
}

struct PokemonsList: Codable, Hashable {
    var name: String?
    var url: String?
    
    init(name: String?, url: String?) {
        self.name = name
        self.url = url
    }
    
    func getID() -> String {
        if let lastComponent = url?.split(separator: "/").last, let number = Int(lastComponent) {
            return number.description
        }
        return ""
    }
}
