//
//  PokemonListViewModel.swift
//  Pokedex
//
//  Created by Gustavo Gutierrez on 03/01/25.
//

import Foundation

class PokemonListViewModel: PokemonListViewModelProtocol {
    
    @Published var filterPokemons: [PokemonDetail] = []
    @Published var isLoad: Bool = false
    @Published var searchText = ""
    
    func fetchPokemons(numberSearch: NumberSearchPokemons) {
        fetchAllPokemons(numberSearch: numberSearch, filter: searchText)
    }
    
    func fetchAllPokemons(numberSearch: NumberSearchPokemons, filter: String?) {
        isLoad = true
        Task {
            do {
                let pokemonsRequest: [PokemonDetail] = try await Client.getPokemonList(numberSearch: filter == "" ? .pokemonList : numberSearch)
                DispatchQueue.main.async { [weak self] in
                    self?.filterPokemons = pokemonsRequest
                    self?.isLoad = false
                    if let safeFilter = filter?.lowercased(), !safeFilter.isEmpty {
                        self?.filterPokemons = pokemonsRequest.filter { pokemon in
                            let nameContainsFilter = pokemon.name?.lowercased().contains(safeFilter) == true
                            let idContainsFilter = pokemon.id?.description.lowercased().contains(safeFilter) == true
                            let typeContainsFilter = pokemon.types?.contains(where: { $0.type?.name?.lowercased().contains(safeFilter) == true }) == true
                            return nameContainsFilter || idContainsFilter || typeContainsFilter
                        }
                    }
                }
            } catch {
                print("Ocurrió un error al obtener la lista de Pokémon: \(error.localizedDescription)")
                DispatchQueue.main.async { [weak self] in
                    self?.isLoad = false
                }
            }
        }
    }
}
