//
//  SubMenu.swift
//  AppColection
//
//  Created by Danilo Osorio on 2/07/25.
//

import SwiftUI

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
        }
    }
}

#Preview {
    SubMenu()
}
