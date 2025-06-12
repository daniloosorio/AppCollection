//
//  ContentView.swift
//  AppColection
//
//  Created by Danilo Osorio on 9/06/25.
//

import SwiftUI
import SwiftData
import LocalAuthentication

struct ContentView: View {

    var body: some View {
        TabView {
            FaceId()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Inicio")
                }
            
            Vibrations()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Buscar")
                }
            
            /*ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Perfil")
                }*/
        }
    }
}

#Preview {
    ContentView()
}
