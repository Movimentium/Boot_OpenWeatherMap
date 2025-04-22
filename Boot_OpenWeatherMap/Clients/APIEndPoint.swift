//  APIEndPoint.swift
//  Boot_OpenWeatherMap
//  Created by Miguel Gallego on 22/4/25.
import Foundation

enum APIEndPoint {
    
    static let baseURL = "https://api.openweathermap.org"
    
    case coordinatesByCity(String)
    case weatherByLatLon(Double, Double)
    
    static func endpointURL(for endpoint: APIEndPoint) -> URL {
        let endpointPath = endpoint.path
        return URL(string: baseURL + endpointPath)!
    }
    
    private var path: String {
        switch self {
        case .coordinatesByCity(let city):
            return "/geo/1.0/direct?q=\(city)&appid=\(weatherAPIKey)"
        case .weatherByLatLon(let lat, let lon):
            return "/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(weatherAPIKey)"
        }
    }
}
