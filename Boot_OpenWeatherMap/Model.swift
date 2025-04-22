//  Model.swift
//  Boot_OpenWeatherMap
//  Created by Miguel Gallego on 22/4/25.
import Foundation

struct Location: Decodable {
    let name: String
    let lat: Double
    let lon: Double
}


struct Weather: Decodable {
    let temp: Double
}

struct WeatherResponse: Decodable {
    let main: Weather
}
