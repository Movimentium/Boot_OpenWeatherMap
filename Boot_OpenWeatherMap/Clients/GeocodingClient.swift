//  GeocodingClient.swift
//  Boot_OpenWeatherMap
//  Created by Miguel Gallego on 22/4/25.
import Foundation

enum NetworkError: Error {
    case invalidResponse
}


struct GeocodingClient {
    
    func coordinatesByCity(_ city: String) async throws -> Location? {
        let (data, response) = try await URLSession.shared.data(from: APIEndPoint.endpointURL(for: .coordinatesByCity(city)))
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 
        else {
            throw NetworkError.invalidResponse
        }
        let locations = try JSONDecoder().decode([Location].self, from: data)
        return locations.first
    }
}
