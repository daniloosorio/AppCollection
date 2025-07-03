//
//  Http.swift
//  AppColection
//
//  Created by Danilo Osorio on 2/07/25.
//

import SwiftUI

struct Http: View {
    private var viewModel: HttpViewModel = HttpViewModel()
    var body: some View {
        VStack {
            Text("Urls sesion")
            Button("Crear peticion http"){
                //viewModel.executeApi()
                viewModel.testDecodable()
            }
        }
    }
}

#Preview {
    Http()
}
