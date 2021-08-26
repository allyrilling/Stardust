//
//  TrackingView.swift
//  TrackingView
//
//  Created by Ally Rilling on 8/3/21.
//

import SwiftUI
import MapKit
import CoreLocation

struct TrackingView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
    @ObservedObject var globalVars: GlobalVars
    
    var timeFont: CGFloat = 20
    var sectionTitleSize: CGFloat = 30
    var spacerHeight: CGFloat = 10
    
    var darkBlue = Color(red: 0.14, green: 0.17, blue: 0.86)
    var lightBlue = Color(red: 0, green: 0.64, blue: 1.0)
    
    var body: some View {
        VStack {
            
            ScrollView {
                // MARK: - Coordinates
                VStack {
                    HStack {
                        Image(systemName: "globe")
                            .font(.system(size: 50))
                        VStack(alignment: .leading) {
                            Text("Coordinates")
                                .font(.system(.title))
                            Text("\(String(format: "%.3f", coordinate?.latitude ?? 0))° \((coordinate?.latitude ?? 0) > 0 ? "N" : "S"), \(String(format: "%.3f", abs(coordinate?.longitude ?? 0)))° \((coordinate?.longitude ?? 0) > 0 ? "E" : "W")")
                        }
                        Spacer()
                    }
                }.padding()
                    .background(RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(.white)
                                    .opacity(0.3))
                    .padding()
                
                Spacer()
                    .frame(height: spacerHeight)
                
                // MARK: - Today
                VStack {
                    Text("Today")
                        .font(.system(size: sectionTitleSize, weight: .bold))
                        .padding(.bottom)
                    HStack {
                        VStack { // Sunrise
                            Image(systemName: "sunrise.fill")
                                .renderingMode(.original)
                                .font(.system(.title))
                            Text("Sunrise")
                            Text("\(globalVars.sunrise)")
                                .font(.system(size: timeFont, weight: .bold))
                        }
                        
                        Spacer()
                        
                        VStack { // Daylight
                            Image(systemName: "sun.max.fill")
                                .renderingMode(.original)
                                .font(.system(.title))
                            Text("Daylight")
                            Text("\(globalVars.daylight)")
                                .font(.system(size: timeFont, weight: .bold))
                        }
                        
                        Spacer()
                        
                        VStack { // Sunset
                            Image(systemName: "sunset.fill")
                                .renderingMode(.original)
                                .font(.system(.title))
                            Text("Sunset")
                            Text("\(globalVars.sunset)")
                                .font(.system(size: timeFont, weight: .bold))
                        }
                    }
                }.padding()
                    .background(RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(.white)
                                    .opacity(0.3))
                    .padding()
                
                Spacer()
                    .frame(height: spacerHeight)
                
                // MARK: - Day Over Day
                VStack {
                    Text("Day Over Day")
                        .font(.system(size: sectionTitleSize, weight: .bold))
                        .padding(.bottom)
                    HStack {
                        VStack { // Sunrise
                            Image(systemName: "sunrise.fill")
                                .renderingMode(.original)
                                .font(.system(.title))
                            Text("Sunrise")
                            Text("\(abs(Int(globalVars.sunriseChangeDoD)!)) min")
                                .font(.system(size: timeFont, weight: .bold))
                            Text("\(Int(globalVars.sunriseChangeDoD)! > 0 ? "Later" : "Earlier" )")
                        }
                        
                        Spacer()
                        
                        VStack { // Daylight
                            Image(systemName: "sun.max.fill")
                                .renderingMode(.original)
                                .font(.system(.title))
                            Text("Daylight")
                            Text("\(abs(Int(globalVars.daylightChangeDoD)!)) min")
                                .font(.system(size: timeFont, weight: .bold))
                            Text("\(Int(globalVars.daylightChangeDoD)! > 0 ? "More" : "Less" )")
                        }
                        
                        Spacer()
                        
                        VStack { // Sunset
                            Image(systemName: "sunset.fill")
                                .renderingMode(.original)
                                .font(.system(.title))
                            Text("Sunset")
                            Text("\(abs(Int(globalVars.sunsetChangeDoD)!)) min")
                                .font(.system(size: timeFont, weight: .bold))
                            Text("\(Int(globalVars.sunsetChangeDoD)! > 0 ? "Later" : "Earlier" )")
                        }
                    }
                }.padding()
                    .background(RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(.white)
                                    .opacity(0.3))
                    .padding()
                
                // MARK: - Week Over Week
                VStack {
                    Text("Week Over Week")
                        .font(.system(size: sectionTitleSize, weight: .bold))
                        .padding(.bottom)
                    HStack {
                        VStack { // Sunrise
                            Image(systemName: "sunrise.fill")
                                .renderingMode(.original)
                                .font(.system(.title))
                            Text("Sunrise")
                            Text("\(abs(Int(globalVars.sunriseChangeWoW)!)) min")
                                .font(.system(size: timeFont, weight: .bold))
                            Text("\(Int(globalVars.sunriseChangeWoW)! > 0 ? "Later" : "Earlier" )")
                        }
                        
                        Spacer()
                        
                        VStack { // Daylight
                            Image(systemName: "sun.max.fill")
                                .renderingMode(.original)
                                .font(.system(.title))
                            Text("Daylight")
                            Text("\(abs(Int(globalVars.daylightChangeWoW)!)) min")
                                .font(.system(size: timeFont, weight: .bold))
                            Text("\(Int(globalVars.daylightChangeWoW)! > 0 ? "More" : "Less" )")
                        }
                        
                        Spacer()
                        
                        VStack { // Sunset
                            Image(systemName: "sunset.fill")
                                .renderingMode(.original)
                                .font(.system(.title))
                            Text("Sunset")
                            Text("\(abs(Int(globalVars.sunsetChangeWoW)!)) min")
                                .font(.system(size: timeFont, weight: .bold))
                            Text("\(Int(globalVars.sunsetChangeWoW)! > 0 ? "Later" : "Earlier" )")
                        }
                    }
                }.padding()
                    .background(RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(.white)
                                    .opacity(0.3))
                    .padding()
                
                
                Spacer()
            }
            
            Link(destination: URL(string: "https://sunrise-sunset.org")!, label: {
                Text("Data provided by Sunrise Sunset")
                    .underline()
                    .font(.system(.caption))
            })
            
        }.foregroundColor(.black)
            
            .background(LinearGradient(gradient: Gradient(colors: [darkBlue, lightBlue]), startPoint: .top, endPoint: .bottom)
                            .edgesIgnoringSafeArea(.all))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    var coordinate: CLLocationCoordinate2D? {
        locationViewModel.lastSeenLocation?.coordinate
    }
}
