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
    
    @Published var sunrise: String = "0"
    @Published var sunset: String = "0"
    @Published var daylight: String =  "0"
    
    @Published var sunriseRaw: String = "0"
    @Published var sunsetRaw: String = "0"
    @Published var daylightRaw: Int =  0
    
    @Published var sunriseYesterday: String = "0"
    @Published var sunsetYesterday: String = "0"
    @Published var daylightYesterday: String =  "0"
    
    @Published var sunriseYesterdayRaw: String = "0"
    @Published var sunsetYesterdayRaw: String = "0"
    @Published var daylightYesterdayRaw: Int =  0
    
    @Published var sunriseChange = "0"
    @Published var sunsetChange = "0"
    @Published var daylightChange = "0"
    
    var sunriseGrad = LinearGradient(gradient: Gradient(colors: [.blue, .orange]), startPoint: .topTrailing, endPoint: .bottomLeading)
    var middayGrad = LinearGradient(gradient: Gradient(colors: [.blue, .orange]), startPoint: .topTrailing, endPoint: .bottomLeading)
    var sunsetGrad = LinearGradient(gradient: Gradient(colors: [.blue, .orange]), startPoint: .topTrailing, endPoint: .bottomLeading)
    
    init() {
        self.defaults = UserDefaults.standard
        
    }
    
}
