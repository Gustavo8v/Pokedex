//
//  PokemonListProtocols.swift
//  Pokedex
//
//  Created by Gustavo Gutierrez on 03/01/25.
//

import Foundation

protocol PokemonListViewModelProtocol: ObservableObject {
    
    var filterPokemons: [PokemonDetail] { get set }
    var isLoad: Bool { get set }
    var searchText: String { get set }
    
    func fetchPokemons(numberSearch: NumberSearchPokemons)
}
