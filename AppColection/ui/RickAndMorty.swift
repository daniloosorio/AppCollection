//
//  RickAndMorty.swift
//  AppColection
//
//  Created by Danilo Osorio on 7/07/25.
//

import SwiftUI

struct RickAndMorty: View {
    var viewModel = RickViewModel()
    var body: some View {
        VStack{
            Text("Rick and Morty")
            VStack{
                AsyncImage(url: viewModel.characterBasicInfo.image)
                Text("Name :\(viewModel.characterBasicInfo.name)")
                Text("First Episode: \(viewModel.characterBasicInfo.firtsEpisodeTitle ?? "")")
                Text("Dimensions: \(viewModel.characterBasicInfo.dimension)")
            }
            .padding(.top,32)
        }
        .task {
           await viewModel.executeRequest()
        }
    }
}

#Preview {
    RickAndMorty()
}
