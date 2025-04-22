//  WeatherClient.swift
//  Boot_OpenWeatherMap
//  Created by Miguel Gallego on 22/4/25.
import Foundation

struct WeatherClient {
    
    func fetchWeather(location: Location) async throws -> Weather {
        let url = APIEndPoint.endpointURL(for: .weatherByLatLon(location.lat, location.lon))
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200
        else {
            throw NetworkError.invalidResponse
        }
        let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
        return weatherResponse.main
    }
}
