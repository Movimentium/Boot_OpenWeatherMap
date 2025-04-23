//  ContentView.swift
//  Boot_OpenWeatherMap
//  Created by Miguel Gallego on 22/4/25.
import SwiftUI

struct ContentView: View {
    @State private var city: String = ""
    @State private var isFetchingWeather: Bool = false
    @State private var weather: Weather?
    
    let geocodingClient = GeocodingClient()
    let weatherClient = WeatherClient()
    
    var body: some View {
        VStack {
            TextField("City", text: $city)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    isFetchingWeather = true
                }
                .task(id: isFetchingWeather) {
                    await doTaskOfFetchWeather()
                }
            Spacer()
            if let weather {
                Text("\(weather.temp)")
            }
            Spacer()
        }
        .padding()
    }
    
    // MARK: - Logic
    private func doTaskOfFetchWeather() async {
        if isFetchingWeather {
            await fetchWeather()
            isFetchingWeather = false
            city = ""
        }
    }
    
    private func fetchWeather() async {
        do {
            guard let location = try await geocodingClient.coordinatesByCity(city) else { return }
            weather = try await weatherClient.fetchWeather(location: location)
        } catch {
            print(error)
        }
    }
}

#Preview {
    ContentView()
}
