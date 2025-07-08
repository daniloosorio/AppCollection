//
//  Pokemon.swift
//  AppColection
//
//  Created by Danilo Osorio on 3/07/25.
//

import SwiftUI

struct Pokemon: View {
    let viewModel :PokemonViewModel = PokemonViewModel()
    var body: some View {
        NavigationView {
            Form {
                ForEach(viewModel.pokemons, id: \.name){pokemon in
                    Text(pokemon.name)
                }
            }.navigationTitle("Pokemons")
                }.onAppear{
                    viewModel.getPokemons()
                }
    }
}

#Preview {
    Pokemon()
}
