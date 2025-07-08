//
//  RickViewModel.swift
//  AppColection
//
//  Created by Danilo Osorio on 7/07/25.
//

import Foundation

struct CharacterModel: Decodable {
    let id: Int
    
}

@Observable
final class RickViewModel {
    
    func executeRequest(){
        let characterURL = URL(string:"")
        
        URLSession.shared.dataTask(with: characterURL){data,response,error in
            let characterModel = try! JSONDecoder().decode(CharacterModel.self,from: data! )
        }.resume()
    }
}
