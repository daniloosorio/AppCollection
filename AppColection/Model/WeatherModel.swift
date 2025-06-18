//
//  WeatherModel.swift
//  AppColection
//
//  Created by Danilo Osorio on 17/06/25.
//

import Foundation

struct WeatherModel {
    let city:String
    let weather:String
    let description:String
    let iconURL:URL?
    let currentTemperature:String
    let minTemperature:String
    let maxTemperature:String
    let humidity:String
    let sunset:Date
    let sunrise:Date
    
    static let empty: WeatherModel = .init(city: "no city",
                                           weather: "no weather",
                                           description: "no description",
                                           iconURL: nil,
                                           currentTemperature: "0",
                                           minTemperature: "0",
                                           maxTemperature: "0",
                                           humidity: "0",
                                           sunset: .now,
                                           sunrise: .now)
}
