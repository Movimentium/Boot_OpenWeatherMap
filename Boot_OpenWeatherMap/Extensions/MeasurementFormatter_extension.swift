//  MeasurementFormatter_extension.swift
//  Boot_OpenWeatherMap
//  Created by Miguel Gallego on 23/4/25.
import Foundation

extension MeasurementFormatter {  // INTERESANTE
    
    static func temperature(value: Double) -> String {
        let numFormatter = NumberFormatter()
        numFormatter.maximumFractionDigits = 0
        
        let formatter = MeasurementFormatter()
        formatter.numberFormatter = numFormatter
        
        let temp = Measurement(value: value, unit: UnitTemperature.kelvin)
        return formatter.string(from: temp)
    }
}
