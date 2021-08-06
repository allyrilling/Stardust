//
//  TimeData.swift
//  TimeData
//
//  Created by Ally Rilling on 7/30/21.
//

import Foundation

struct TimeData: Decodable {
    var sunrise: String
    var sunset: String
    var solarNoon: String
    var dayLength: Int
    var civilTwilightBegin: String
    var civilTwilightEnd: String
    var nauticalTwilightBegin: String
    var nauticalTwilightEnd: String
    var astronomicalTwilightBegin: String
    var astronomicalTwilightEnd: String
}

extension TimeData {
    enum CodingKeys: String, CodingKey {
        case sunrise
        case sunset
        case solarNoon = "solar_noon"
        case dayLength = "day_length"
        case civilTwilightBegin = "civil_twilight_begin"
        case civilTwilightEnd = "civil_twilight_end"
        case nauticalTwilightBegin = "nautical_twilight_begin"
        case nauticalTwilightEnd = "nautical_twilight_end"
        case astronomicalTwilightBegin = "astronomical_twilight_begin"
        case astronomicalTwilightEnd = "astronomical_twilight_end"
    }
}
