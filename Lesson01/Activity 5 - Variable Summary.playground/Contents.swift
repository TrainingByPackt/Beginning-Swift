//: Using Optionals

import UIKit

// create variables to represent the weather in a specific location
let cityName = "Berlin"
var humidityPercentage: Double?
var temperatureCentigrade: Double?

// create a tuple to store all values in a single named variable
var weather = (city: cityName, humidityPercentage: humidityPercentage, temperature: temperatureCentigrade)

weather.1 = 0.70
/// the following line is probably even better!
//  weather.humidityPercentage = 0.7


print(weather)

print("City: \(weather.city)")
print("Humidity: \(String(describing:weather.humidityPercentage))")
print("Temperature: \(String(describing:weather.temperature))")


