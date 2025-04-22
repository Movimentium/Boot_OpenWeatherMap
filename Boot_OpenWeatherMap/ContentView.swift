//  ContentView.swift
//  Boot_OpenWeatherMap
//  Created by Miguel Gallego on 22/4/25.
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Get coordinates") {
                Task {
                    let location = try! await GeocodingClient().coordinatesByCity("Avila")
                    print(location!)
                    let weather = try! await WeatherClient().fetchWeather(location: location!)
                    print(weather)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
