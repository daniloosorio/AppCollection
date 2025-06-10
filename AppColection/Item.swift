//
//  Item.swift
//  AppColection
//
//  Created by Danilo Osorio on 9/06/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
