//
//  WeatherModelMapper.swift
//  AppColection
//
//  Created by Danilo Osorio on 17/06/25.
//

import Foundation

struct WeatherModelMapper {
    func mapDataModelToModel(dataModel:ResponseDataModel)->WeatherModel{
        guard let weather = dataModel.weather.first else {
            return .empty
        }
        
        let temperature = dataModel.temperature
        
        let sunsetWithTimezone = dataModel.sun.sunset.addingTimeInterval(dataModel.timezone - Double(TimeZone.current.secondsFromGMT()))
        let sunriseWithTimezone = dataModel.sun.sunrise.addingTimeInterval(dataModel.timezone - Double(TimeZone.current.secondsFromGMT()))

        return WeatherModel(city: dataModel.city,
                            weather: weather.main,
                            description: "(\(weather.description))",
                            iconURL: URL(string: "http://openweathermap.org/img/wn/\(weather.iconURLString)@2x.png"),
                            currentTemperature: "\(Int(temperature.currentTemperature))°",
                            minTemperature: "\(Int(temperature.minTemperature))° Min",
                            maxTemperature: "\(Int(temperature.maxTemperature))° Max",
                            humidity: "\(temperature.humidity)%",
                            sunset: sunsetWithTimezone,
                            sunrise: sunriseWithTimezone)
    }
}
