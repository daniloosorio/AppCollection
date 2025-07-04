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
                        Image(systemName: "faceid")
                        Text("Face Id")
                    }
                
                Vibrations()
                    .tabItem {
                        Image(systemName: "phone.down.waves.left.and.right")
                        Text("Vibrar")
                    }
                SubMenu().tabItem {
                    Image(systemName: "tray.full")
                    Text("Mas")
                }
                
                Weather()
                    .tabItem {
                        Image(systemName: "cloud.drizzle.fill")
                        Text("Clima")
                    }
                NFCreader()
                    .tabItem {
                        Image(systemName: "dot.radiowaves.left.and.right")
                        Text("NFC")
                    }
            }
    }
}

#Preview {
    ContentView()
}
