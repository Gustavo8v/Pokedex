//
//  DetailPokemonView.swift
//  Pokedex
//
//  Created by Gustavo Gutierrez on 04/01/25.
//

import SwiftUI

struct DetailPokemonView<ViewModel: DetailPokemonViewModelProtocol>: View {
    
    @StateObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss
    @Binding var typePokemonClicked: String
    
    var body: some View {
        ScrollView {
            VStack {
                Text(viewModel.pokemon.name ?? "")
                    .font(.largeTitle.bold())
                Text("Number: \(viewModel.pokemon.id ?? .zero)")
                FlipImageView(frontURL: viewModel.pokemon.sprites?.frontDefault ?? "",
                              shinyURL: viewModel.pokemon.sprites?.frontShiny ?? "")
                .frame(width: 200, height: 200)
                HStack {
                    Text("Types:")
                        .font(.title)
                    Spacer()
                }
                typesCollection
                HStack {
                    Text("Stats:")
                        .font(.title)
                    Spacer()
                }
                statsCollection
                Spacer()
            }.padding()
        }
    }
    
    private var statsCollection: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem(.flexible())], spacing: 16) {
                ForEach(viewModel.pokemon.stats ?? [], id: \.self) { stat in
                    CollectionCell(text: "\(stat.stat?.name ?? ""):\n\(stat.baseStat?.description ?? "")",
                                   withRandomColor: false)
                }
            }
        }
    }
    
    private var typesCollection: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem(.flexible())], spacing: 16) {
                ForEach(viewModel.pokemon.types ?? [], id: \.self) { type in
                    CollectionCell(text: type.type?.name ?? "",
                                   withRandomColor: true)
                    .onTapGesture {
                        dismiss()
                        typePokemonClicked = type.type?.name ?? ""
                    }
                }
            }
        }
    }
}

#Preview {
    let viewModel = DetailPokemonViewModel(pokemon: PokemonDetail())
    DetailPokemonView(viewModel: viewModel, typePokemonClicked: .constant(""))
}
