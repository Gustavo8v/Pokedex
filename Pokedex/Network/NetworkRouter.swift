//
//  NetworkRouter.swift
//  Pokedex
//
//  Created by Gustavo Gutierrez on 04/01/25.
//

import Foundation

enum NetworkRouter {
    case fetchPokemons(limits: Int)
    case detailPokemon(id: String)
}

extension NetworkRouter {
    
    var path: String {
        switch self {
        case .fetchPokemons(let limits):
            return "pokemon?limit=\(limits)&offset=0"
        case .detailPokemon(id: let id):
            return "pokemon/\(id)/"
        }
    }
    
    var httpMethod: String {
        switch self {
        default:
            return "GET"
        }
    }
}
