//
//  ViewModel.swift
//  AppColection
//
//  Created by Danilo Osorio on 11/06/25.
//

import Foundation
import UIKit
import CoreHaptics

class ViewModel {
    static let shared: ViewModel = ViewModel()
    var engine: CHHapticEngine?
    
    private init() {}
    
    func vibrate(type:UINotificationFeedbackGenerator.FeedbackType){
        let feedbackGenerator = UINotificationFeedbackGenerator()
        feedbackGenerator.prepare()
        feedbackGenerator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle){
        let feedbackGenerator =  UIImpactFeedbackGenerator(style: style)
        feedbackGenerator.impactOccurred()
    }
    
    func prepararEngine() {
            do {
                engine = try CHHapticEngine()
                try engine?.start()
            } catch {
                print("Error al iniciar el motor háptico: \(error)")
            }
        }
    
    func vibrarDurante(segundos: Double) {
            guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
            
            var events = [CHHapticEvent]()
            
            let intensidad: Float = 1.0  // Entre 0.0 y 1.0
        let sharpness: Float = 1.0   // Entre 0.0 y 1.0
            let intervalo: Double = 0.009
            
            var tiempo: Double = 0.0
            while tiempo < segundos {
                let event = CHHapticEvent(
                    eventType: .hapticTransient,
                    parameters: [
                        CHHapticEventParameter(parameterID: .hapticIntensity, value: intensidad),
                        CHHapticEventParameter(parameterID: .hapticSharpness, value: sharpness)
                    ],
                    relativeTime: tiempo
                )
                events.append(event)
                tiempo += intervalo
            }
            
            do {
                let pattern = try CHHapticPattern(events: events, parameters: [])
                let player = try engine?.makePlayer(with: pattern)
                try player?.start(atTime: 0)
            } catch {
                print("Error al crear el patrón háptico: \(error)")
            }
        }
}
