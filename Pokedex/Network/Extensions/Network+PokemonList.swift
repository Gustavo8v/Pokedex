//
//  Network+PokemonList.swift
//  Pokedex
//
//  Created by Gustavo Gutierrez on 04/01/25.
//

import Foundation

extension Client {
    
    static func getPokemonList(numberSearch: NumberSearchPokemons) async throws -> [PokemonDetail] {
        do {
            let pokemons: Pokemons = try await client.request(request: .fetchPokemons(limits: numberSearch.rawValue))
            let detailPokemons: [PokemonDetail] = try await getPokemonsDetail(pokemons: pokemons)
            return detailPokemons.sorted { ($0.id ?? 0) < ($1.id ?? 0) }
        } catch {
            throw ServiceErrors.genericError
        }
    }
    
    static private func getPokemonsDetail(pokemons: Pokemons, maxConcurrentTasks: Int = 10) async throws -> [PokemonDetail] {
        var details: [PokemonDetail] = []
        let pokemonChunks = pokemons.results.chunked(into: maxConcurrentTasks)
        for chunk in pokemonChunks {
            let chunkDetails = await withTaskGroup(of: PokemonDetail?.self) { group -> [PokemonDetail?] in
                for pokemon in chunk {
                    group.addTask {
                        do {
                            return try await client.request(request: .detailPokemon(id: pokemon.getID()))
                        } catch {
                            print("Error al obtener detalles de Pokémon con ID \(pokemon.getID()): \(error.localizedDescription)")
                            return nil
                        }
                    }
                }
                var results: [PokemonDetail?] = []
                for await detail in group {
                    results.append(detail)
                }
                return results
            }
            details.append(contentsOf: chunkDetails.compactMap { $0 })
        }
        return details
    }
}
