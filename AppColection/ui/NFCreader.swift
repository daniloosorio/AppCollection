//
//  NFCreader.swift
//  AppColection
//
//  Created by Danilo Osorio on 25/06/25.
//
import SwiftUI

struct NFCreader: View {
    let viewModel: NFCViewModel = NFCViewModel()
    var body: some View {
        VStack {
            GroupBox(label:Label("Balance",systemImage: "creditcard.fill")){
                HStack {
                    Text("$----")
                        .font(.system(.largeTitle,design: .rounded))
                        .fontWeight(.bold)
                    Spacer()
                }
            }.padding()
            
            Button(action: {viewModel.startNFC()}, label: {Text("Scan Card")})
                .tint(.green)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
        }
    }
}
