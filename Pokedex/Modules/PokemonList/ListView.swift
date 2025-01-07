//
//  ListView.swift
//  Pokedex
//
//  Created by Gustavo Gutierrez on 03/01/25.
//

import SwiftUI

struct ListView<ViewModel: PokemonListViewModelProtocol>: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            if viewModel.isLoad {
                ProgressView()
            } else {
                listPokemons
            }
        }
        .navigationTitle("Búsqueda")
        .searchable(text: $viewModel.searchText, prompt: "Buscar Pokemons")
        .onAppear {
            viewModel.fetchPokemons(numberSearch: .pokemonList)
        }
        .onChange(of: viewModel.searchText) {
            viewModel.fetchPokemons(numberSearch: .searchPokemon)
        }
    }
    
    private var listPokemons: some View {
        VStack {
            List(viewModel.filterPokemons, id: \.self) { pokemon in
                NavigationLink {
                    let viewModel = DetailPokemonViewModel(pokemon: pokemon)
                    DetailPokemonView(viewModel: viewModel,
                                      typePokemonClicked: $viewModel.searchText)
                } label: {
                    PokemonCell(name: pokemon.name ?? "",
                                idPokemon: pokemon.id?.description ?? "")
                    .frame(height: 60)
                }
            }
            .listStyle(.plain)
        }.padding()
    }
}

#Preview {
    ListView(viewModel: PokemonListViewModel())
}
