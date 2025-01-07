//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Gustavo Gutierrez on 03/01/25.
//

import SwiftUI

@main
struct PokedexApp: App {

    var body: some Scene {
        WindowGroup {
            ListView(viewModel: PokemonListViewModel())
        }
    }
}
