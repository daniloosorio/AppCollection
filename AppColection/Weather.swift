//
//  Wheather.swift
//  AppColection
//
//  Created by Danilo Osorio on 17/06/25.
//

import SwiftUI

struct Weather: View {
    private let weatherViewModel = WeatherViewModel()
    
    var body: some View {
       let state = weatherViewModel.watherModel
        ZStack{
            VStack{
                Text(state.city)
                    .foregroundColor(.white)
                    .font(.system(size: 70))
                Text(state.description)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.bottom,8)
                HStack {
                    if let url = state.iconURL {
                        AsyncImage(url: url){ image in
                            image
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    Text(state.currentTemperature)
                        .font(.system(size: 70))
                        .foregroundColor(.white)
                }
                .padding(.top,-20)
                HStack(spacing:14){
                    Label(state.maxTemperature,systemImage: "thermometer.sun.fill")
                    Label(state.minTemperature,systemImage: "thermometer.snowflake")
                }
                .symbolRenderingMode(.multicolor)
                .foregroundColor(.white)
                Divider()
                    .foregroundColor(.white)
                    .padding()
                HStack(spacing:32){
                    VStack {
                        Image(systemName: "sunrise.fill")
                            .symbolRenderingMode(.multicolor)
                        Text(state.sunrise,style: .time)
                    }
                    VStack {
                        Image(systemName: "sunset.fill")
                            .symbolRenderingMode(.multicolor)
                        Text(state.sunset,style: .time)
                    }
                }
                Divider()
                    .foregroundColor(.white)
                    .padding()
                Label(state.humidity,systemImage: "humidity.fill")
                    .symbolRenderingMode(.multicolor)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.top,32)
        }
        .background(
            LinearGradient(colors:[.blue, .purple],startPoint: .topLeading,endPoint: .bottomTrailing)
        ).task {
            await weatherViewModel.getWeather(city: "Medellin")
        }
    }
}

#Preview {
    Weather()
}
