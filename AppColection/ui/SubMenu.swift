//
//  SubMenu.swift
//  AppColection
//
//  Created by Danilo Osorio on 2/07/25.
//

import SwiftUI
import UIKit

struct SubMenu: View {
    var body: some View {
        TabView {
            Http()
                .tabItem {
                Image(systemName: "hand.point.up")
                Text("Http")
            }
            Store()
                .tabItem {
                Image(systemName: "storefront")
                Text("Http")
            }
            Pokemon()
                .tabItem {
                    Image("pokebola2").renderingMode(.original)
                    Text("Pokemon")
                }
            RickAndMorty() .tabItem {
                Image("pokebola2").renderingMode(.original)
                Text("Pokemon")
            }
            
        }
    }
}

#Preview {
    SubMenu()
}


