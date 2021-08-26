//
//  Logic.swift
//  Logic
//
//  Created by Ally Rilling on 7/30/21.
//

import Foundation

class Logic {
    
    static func queryAPI(globalVars: GlobalVars, locationViewModel: LocationViewModel) {
        
        // MARK: - Today
        guard let url = URL(string: "https://api.sunrise-sunset.org/json?lat=\(locationViewModel.lastSeenLocation?.coordinate.latitude ?? 0)&lng=\(locationViewModel.lastSeenLocation?.coordinate.longitude ?? 0)&date=today&formatted=0") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let decodedResponse = try! JSONDecoder().decode(APIResponse.self, from: data!)
            
            DispatchQueue.main.async {
                globalVars.sunriseRaw = decodedResponse.results.sunrise
                globalVars.sunsetRaw = decodedResponse.results.sunset
                globalVars.daylightRaw = decodedResponse.results.dayLength
                
                globalVars.sunrise = convertUtcToLocalTime(dateStr: decodedResponse.results.sunrise) ?? "N/A"
                globalVars.sunset = convertUtcToLocalTime(dateStr: decodedResponse.results.sunset) ?? "N/A"
                globalVars.daylight = "\(convertDaylight(daylight: decodedResponse.results.dayLength))"
            }

        }.resume()
        
        // MARK: - DoD
        guard let url = URL(string: "https://api.sunrise-sunset.org/json?lat=\(locationViewModel.lastSeenLocation?.coordinate.latitude ?? 0)&lng=\(locationViewModel.lastSeenLocation?.coordinate.longitude ?? 0)&date=yesterday&formatted=0") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let decodedResponse = try! JSONDecoder().decode(APIResponse.self, from: data!)
            
            DispatchQueue.main.async {
                globalVars.sunriseYesterdayRaw = decodedResponse.results.sunrise
                globalVars.sunsetYesterdayRaw = decodedResponse.results.sunset
                globalVars.daylightYesterdayRaw = decodedResponse.results.dayLength
                
                globalVars.sunriseYesterday = convertUtcToLocalTime(dateStr: decodedResponse.results.sunrise) ?? "N/A"
                globalVars.sunsetYesterday = convertUtcToLocalTime(dateStr: decodedResponse.results.sunset) ?? "N/A"
                globalVars.daylightYesterday = convertDaylight(daylight: decodedResponse.results.dayLength)
                
                globalVars.sunriseChangeDoD = calcDifInTime(today: globalVars.sunrise, yesterday: globalVars.sunriseYesterday)
                globalVars.sunsetChangeDoD = calcDifInTime(today: globalVars.sunset, yesterday: globalVars.sunsetYesterday)
                globalVars.daylightChangeDoD = calcDifInDaylight(todayRaw: globalVars.daylightRaw, yesterdayRaw: globalVars.daylightYesterdayRaw)
            }

        }.resume()
        
        // MARK: - WoW
        guard let url = URL(string: "https://api.sunrise-sunset.org/json?lat=\(locationViewModel.lastSeenLocation?.coordinate.latitude ?? 0)&lng=\(locationViewModel.lastSeenLocation?.coordinate.longitude ?? 0)&date=-7weekdays&formatted=0") else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let decodedResponse = try! JSONDecoder().decode(APIResponse.self, from: data!)
            
            DispatchQueue.main.async {
                globalVars.sunriseLastWeekRaw = decodedResponse.results.sunrise
                globalVars.sunsetLastWeekRaw = decodedResponse.results.sunset
                globalVars.daylightLastWeekRaw = decodedResponse.results.dayLength
                
                globalVars.sunriseLastWeek = convertUtcToLocalTime(dateStr: decodedResponse.results.sunrise) ?? "N/A"
                globalVars.sunsetLastWeek = convertUtcToLocalTime(dateStr: decodedResponse.results.sunset) ?? "N/A"
                globalVars.daylightLastWeek = convertDaylight(daylight: decodedResponse.results.dayLength)
                
                globalVars.sunriseChangeWoW = calcDifInTime(today: globalVars.sunrise, yesterday: globalVars.sunriseLastWeek)
                globalVars.sunsetChangeWoW = calcDifInTime(today: globalVars.sunset, yesterday: globalVars.sunsetLastWeek)
                globalVars.daylightChangeWoW = calcDifInDaylight(todayRaw: globalVars.daylightRaw, yesterdayRaw: globalVars.daylightLastWeekRaw)
            }

        }.resume()
        
    }
    
    static func convertUtcToLocalTime(dateStr: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssz"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        if let date = dateFormatter.date(from: dateStr) {
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.dateFormat = "h:mm a"
        
            return dateFormatter.string(from: date)
        }
        return nil
    }
    
    static func convertDaylight(daylight: Int) -> String {
        let hours = daylight / 3600
        let minutes = Int((((Double(daylight) / 3600.0) - Double(hours)) * 60).rounded())
        
        return "\(hours)h \(minutes)m"
    }
    
    static func calcDifInTime(today: String, yesterday: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        
        let todayFormatted = formatter.date(from: today) ?? Date()
        let yesterdayFormatted = formatter.date(from: yesterday) ?? Date()

        let changeInMinutes = Int((todayFormatted.timeIntervalSince(yesterdayFormatted) / 60).rounded())
        
        return "\(changeInMinutes)"
    }
    
    static func calcDifInDaylight(todayRaw: Int, yesterdayRaw: Int) -> String {
        let hoursToday = todayRaw / 3600
        let minutesToday = Int((((Double(todayRaw) / 3600.0) - Double(hoursToday)) * 60).rounded())
        let todayString = "\(hoursToday):\(minutesToday)"
        
        let hoursYesterday = yesterdayRaw / 3600
        let minutesYesterday = Int((((Double(yesterdayRaw) / 3600.0) - Double(hoursYesterday)) * 60).rounded())
        let yesterdayString = "\(hoursYesterday):\(minutesYesterday)"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        let todayFormatted = formatter.date(from: todayString) ?? Date()
        let yesterdayFormatted = formatter.date(from: yesterdayString) ?? Date()

        let changeInMinutes = Int((todayFormatted.timeIntervalSince(yesterdayFormatted) / 60).rounded())
        
        return "\(changeInMinutes)"
        
    }
    
}
