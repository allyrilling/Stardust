//
//  GlobalVars.swift
//  GlobalVars
//
//  Created by Ally Rilling on 7/30/21.
//

import Foundation
import SwiftUI

class GlobalVars: ObservableObject {
    
    var defaults: UserDefaults
    
    // MARK: - Today
    @Published var sunrise: String = "0"
    @Published var sunset: String = "0"
    @Published var daylight: String =  "0"
    
    @Published var sunriseRaw: String = "0"
    @Published var sunsetRaw: String = "0"
    @Published var daylightRaw: Int =  0
    
    // MARK: - Day Over Day
    @Published var sunriseYesterday: String = "0"
    @Published var sunsetYesterday: String = "0"
    @Published var daylightYesterday: String =  "0"
    
    @Published var sunriseYesterdayRaw: String = "0"
    @Published var sunsetYesterdayRaw: String = "0"
    @Published var daylightYesterdayRaw: Int =  0
    
    @Published var sunriseChangeDoD = "0"
    @Published var sunsetChangeDoD = "0"
    @Published var daylightChangeDoD = "0"
    
    // MARK: - Week Over Week
    
    @Published var sunriseLastWeek: String = "0"
    @Published var sunsetLastWeek: String = "0"
    @Published var daylightLastWeek: String =  "0"
    
    @Published var sunriseLastWeekRaw: String = "0"
    @Published var sunsetLastWeekRaw: String = "0"
    @Published var daylightLastWeekRaw: Int =  0
    
    @Published var sunriseChangeWoW = "0"
    @Published var sunsetChangeWoW = "0"
    @Published var daylightChangeWoW = "0"
    
    // MARK: - Month Over Month
    
    @Published var sunriseLastMonth: String = "0"
    @Published var sunsetLastMonth: String = "0"
    @Published var daylightLastMonth: String =  "0"
    
    @Published var sunriseLastMonthRaw: String = "0"
    @Published var sunsetLastMonthRaw: String = "0"
    @Published var daylightLastMonthRaw: Int =  0
    
    @Published var sunriseChangeMoM = "0"
    @Published var sunsetChangeMoM = "0"
    @Published var daylightChangeMoM = "0"
    
    // MARK: - Gradient
    var sunriseGrad = LinearGradient(gradient: Gradient(colors: [.blue, .orange]), startPoint: .topTrailing, endPoint: .bottomLeading)
    var middayGrad = LinearGradient(gradient: Gradient(colors: [.blue, .orange]), startPoint: .topTrailing, endPoint: .bottomLeading)
    var sunsetGrad = LinearGradient(gradient: Gradient(colors: [.blue, .orange]), startPoint: .topTrailing, endPoint: .bottomLeading)
    
    init() {
        self.defaults = UserDefaults.standard
        
    }
    
}
