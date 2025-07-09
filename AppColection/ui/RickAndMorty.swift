//
//  RickAndMorty.swift
//  AppColection
//
//  Created by Danilo Osorio on 7/07/25.
//

import SwiftUI

struct RickAndMorty: View {
    let viewModel = RickViewModel()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).onAppear{
            viewModel.executeRequest()
        }
    }
}

#Preview {
    RickAndMorty()
}
