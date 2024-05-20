import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    let hour = Calendar.current.component(.hour, from: Date())
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var isDaytime: Bool {
        return (hour >= 6 && hour < 20)
    }
    var conditionName: String {
            switch conditionId {
            case 200...232:
                return "cloud.bolt"
            case 300...500:
                return "cloud.drizzle"
            case 501...531:
                return "cloud.rain"
            case 600...622:
                return "cloud.snow"
            case 701...781:
                return "cloud.fog"
            case 800:
                return "sun.max"
            case 801...804:
                return "cloud"
            default:
                return "cloud"
                
            }
        }
    
    var backgroundName: String {
        switch (conditionId, isDaytime) {
        case (200...232, _):
            return isDaytime ? "DayLightning.jpg" : "NightLightning.jpg"
            
        case (300...321, _):
            return isDaytime ? "LightRain.jpg" : "LightRainNight.jpg"
            
        case (500, _):
            return isDaytime ? "LightRain.jpg" : "LightRainNight.jpg"
            
        case (501...531, _):
            return isDaytime ? "RainDay.jpg" : "RainNight.jpg"
            
        case (600...622, _):
            return isDaytime ? "WinterHeavySnow.jpg" : "WinterNightHeavySnow.jpg"
            
        case (701...781, _):
            return isDaytime ? "DayFog.jpg" : "NightFog.jpg"
            
        case (800, _):
            return isDaytime ? "BrightSunny.jpg" : "SummerNightClear.jpg"
            
        case (804, _):
            return isDaytime ? "OvercastDay.jpg" : "OvercastNight.jpg"
            
        case (801...803, _):
            return isDaytime ? "DayClouds.jpg" : "NightClouds.jpg"
            
        default:
            return ""
        }
    }
}


