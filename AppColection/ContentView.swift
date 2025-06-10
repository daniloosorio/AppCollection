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
    @State var canShowSecretMessage: Bool = false
    let context = LAContext()
    
    var body: some View {
        VStack {
            Button(action: {
                authenticate()
            },label:{
                VStack{
                    Image(systemName: "faceid")
                        .font(.system(size:129))
                    Text("Pulsa para mostar el secreto")
                        .padding(.top,20)
                }
            })
            if canShowSecretMessage {
                Text("hola este es el mensaje secreto")
                    .font(.largeTitle)
                    .bold()
                    .padding()
            }
        }
        .offset(y: -100)
        .padding()
    
    }
    
    func authenticate(){
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Por favor autenticate para continuar"){ success, error in
                if success{
                    self.canShowSecretMessage.toggle()
                }else{
                    print("No se pudo autenticar")
                }
                
            }
        }else{
            print("el dispositivo no soporta face Id")
        }
    }
}

#Preview {
    ContentView()
}
