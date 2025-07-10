//
//  RickViewModel.swift
//  AppColection
//
//  Created by Danilo Osorio on 7/07/25.
//

import Foundation

struct CharacterModel: Decodable {
    let id: Int
    let name:String
    let image:String
    let episode: [String]
    let locationName: String
    let locationUrl: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case image
        case episode
        case location
        case locationUrl = "url"
    }
    
    init(from decoder: any Decoder) throws {
        let container: KeyedDecodingContainer<CharacterModel.CodingKeys> = try decoder.container(keyedBy: CharacterModel.CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: CharacterModel.CodingKeys.id)
        self.name = try container.decode(String.self, forKey: CharacterModel.CodingKeys.name)
        self.image = try container.decode(String.self, forKey: CharacterModel.CodingKeys.image)
        self.episode = try container.decode([String].self, forKey: CharacterModel.CodingKeys.episode)
        
        let locationContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .location)
        self.locationName = try locationContainer.decode(String.self, forKey: .name)
        self.locationUrl = try locationContainer.decode(String.self, forKey: .locationUrl)
        
    }
    
    
}

struct EpisodeModel: Decodable {
    let id: Int
    let name :String
}

struct LocationModel: Decodable {
    let id:Int
    let name:String
    let dimension:String
}

struct CharacterBasicInfo {
    let name: String
    let image: URL?
    let firtsEpisodeTitle: String?
    let dimension : String
    
    static var empty: Self {
        .init(name: "", image: nil, firtsEpisodeTitle: "", dimension: "")
    }
    
}

@Observable
final class RickViewModel {
    var characterBasicInfo: CharacterBasicInfo = .empty
    /*func executeRequest(){
     let characterURL = URL(string:"https://rickandmortyapi.com/api/character/1")!
     
     URLSession.shared.dataTask(with: characterURL){data,response,error in
     let characterModel = try! JSONDecoder().decode(CharacterModel.self,from: data! )
     //print("\(characterModel)")
     
     let firstEpisodeURL = URL(string:characterModel.episode.first!)!
     
     URLSession.shared.dataTask(with: firstEpisodeURL){data,response,error in
     let episodeModel = try! JSONDecoder().decode(EpisodeModel.self,from: data! )
     print("\(episodeModel)")
     
     let characterLocationURL = URL(string:characterModel.locationUrl)!
     
     URLSession.shared.dataTask(with: characterLocationURL){data, response, error in
     let locationModel = try! JSONDecoder().decode(LocationModel.self, from: data!)
     print("location: \(locationModel)")
     DispatchQueue.main.async {
     self.characterBasicInfo = .init(
     name: characterModel.name,
     image: URL(string: characterModel.image)!,
     firtsEpisodeTitle: episodeModel.name,
     dimension: locationModel.dimension
     )
     }
     }.resume()
     }.resume()
     }.resume()
     }*/
    
    func executeRequest() async {
        let characterURL = URL(string:"https://rickandmortyapi.com/api/character/1")!
        
        let (data,_) = try! await URLSession.shared.data(from: characterURL)
        let characterModel = try! JSONDecoder().decode(CharacterModel.self, from: data)
        print("character: \(characterModel)")
        
        let firtsEpisodeURL = URL(string: characterModel.episode.first!)!
        let (dataFirstEpisode, _) = try! await URLSession.shared.data(from: firtsEpisodeURL)
        let episodeModel = try! JSONDecoder().decode(EpisodeModel.self, from: dataFirstEpisode)
        print("Episode model \(episodeModel)")
        
        let characterLocationURL = URL(string:characterModel.locationUrl)!
        let (dataLocation, _) = try! await URLSession.shared.data(from: characterLocationURL)
        let locationModel = try! JSONDecoder().decode(LocationModel.self, from: dataLocation)
        print("location: \(locationModel)")
        
        await MainActor.run {
                    self.characterBasicInfo = .init(name: characterModel.name,
                                                    image: URL(string: characterModel.image),
                                                    firtsEpisodeTitle: episodeModel.name,
                                                    dimension: locationModel.dimension)
                }
    }
}
