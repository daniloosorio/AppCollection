//
//  Vibrations.swift
//  AppColection
//
//  Created by Danilo Osorio on 11/06/25.
//

import SwiftUI


struct Vibrations: View {
    var body: some View {
        VStack {
            Text("UINotificationFeedbackGenerator").bold()
            HStack {
                Button("Vibrate\n Success"){
                    ViewModel.shared.vibrate(type: .success)
                }
                .buttonStyle(.bordered)
                .tint(.green)
                
                Button("Vibrate\n warning"){
                    ViewModel.shared.vibrate(type: .warning)
                }
                .buttonStyle(.bordered)
                .tint(.yellow)
                
                Button("Vibrate\n Error"){
                    ViewModel.shared.vibrate(type: .error)
                }
                .buttonStyle(.bordered)
                .tint(.red)
            }.padding(.bottom,32)
            
            Text("UIImpactFeedbackGenerator").bold()
            HStack {
                Button("Light"){
                    ViewModel.shared.impact(style: .light)
                }
                .buttonStyle(.bordered)
                .tint(.green)
                
                Button("Medium"){
                    ViewModel.shared.impact(style: .medium)
                }
                .buttonStyle(.bordered)
                .tint(.yellow)
                
                Button("Heavy"){
                    ViewModel.shared.impact(style: .heavy)
                }
                .buttonStyle(.bordered)
                .tint(.red)
            }.padding(.bottom,32)
            
            VStack {
                Button("Vibrar por 5 segundos") {
                    ViewModel.shared.vibrarDurante(segundos: 5)
                }
            }
            .onAppear {
                ViewModel.shared.prepararEngine()
            }
            
        }.padding()
    }
    

}

#Preview {
    Vibrations()
}
