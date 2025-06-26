//
//  WeatherViewModel.swift
//  AppColection
//
//  Created by Danilo Osorio on 17/06/25.
//


//http://api.openweathermap.org/data/2.5/weather?q=medellin&appid=71c3e78149e90edcb26b5c8bf57708fa&units=metric&lang=es
import Foundation
import Observation

@Observable
final class WeatherViewModel{
    var watherModel: WeatherModel = .empty
    private let weatherModelWrapper: WeatherModelMapper = WeatherModelMapper()
    
    func getWeather(city:String) async {
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=71c3e78149e90edcb26b5c8bf57708fa&units=metric&lang=es")
        
        do{
            async let (data, _) = try await URLSession.shared.data(from: url!)
            let dataModel = try! await JSONDecoder().decode(ResponseDataModel.self, from: data)
            DispatchQueue.main.async {
                self.watherModel = self.weatherModelWrapper.mapDataModelToModel(dataModel: dataModel)
            }
        }catch {
            print(error.localizedDescription)
        }
    }
}
