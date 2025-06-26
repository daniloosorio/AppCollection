//
//  NFCViewModel.swift
//  AppColection
//
//  Created by Danilo Osorio on 25/06/25.
//

import Foundation
import Observation
import CoreNFC

import CoreNFC

@Observable
final class NFCViewModel {
    
    private var session: NFCNDEFReaderSession?
    private var nfcManager: NfcManager?

    func startNFC() {
        print("button nfc start")
        let manager = NfcManager()
        let session = NFCNDEFReaderSession(delegate: manager, queue: .main, invalidateAfterFirstRead: false)
        self.nfcManager = manager
        self.session = session
        session.begin()
    }
}

class NfcManager: NSObject, NFCNDEFReaderSessionDelegate {
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: any Error) {
        print("🛑 Sesión invalidada: \(error.localizedDescription)")
        if let nfcError = error as? NFCReaderError {
            switch nfcError.code {
            case .readerSessionInvalidationErrorUserCanceled:
                print("👤 Usuario canceló la sesión")
            case .readerSessionInvalidationErrorSessionTimeout:
                print("⏰ Tiempo de sesión agotado")
            case .readerTransceiveErrorTagConnectionLost:
                print("📡 Conexión con etiqueta perdida")
            default:
                print("❓ Otro error NFC: \(nfcError.code.rawValue)")
            }
        }
    }

    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        print("✅ NDEF detectado")
        for message in messages {
            for record in message.records {
                if let type = String(data: record.type, encoding: .utf8),
                   let payload = String(data: record.payload, encoding: .utf8) {
                    print("📦 Tipo: \(type), Payload: \(payload)")
                }
            }
        }
    }
}
