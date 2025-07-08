//
//  PokemonViewModel.swift
//  AppColection
//
//  Created by Danilo Osorio on 3/07/25.
//

import Foundation

struct PokemonDataModel: Decodable {
    let name: String
    let url: String
}

struct PokemonResponseDataModel: Decodable {
    let pokemon: [PokemonDataModel]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    
    init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pokemon = try container.decode([PokemonDataModel].self, forKey: .results)
    }
}

@Observable
final class PokemonViewModel {
    var pokemons: [PokemonDataModel] = []
    func getPokemons(){
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if let _ = error {
                print("Error")
            }
            
            if let data = data,
               let httpResponse = response as? HTTPURLResponse,
               httpResponse.statusCode == 200 {
                let pokemonDataModel = try! JSONDecoder().decode(PokemonResponseDataModel.self, from: data)
                print("Pokemons \(pokemonDataModel)")
                DispatchQueue.main.async {
                    self.pokemons = pokemonDataModel.pokemon
                }
                
            }
        }.resume()
    }
}
