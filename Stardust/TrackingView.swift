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
                
                VStack {
                    Text("Today")
                        .font(.system(size: sectionTitleSize, weight: .bold))
                        .padding(.bottom)
                    HStack {
                        VStack {
                            Image(systemName: "sunrise.fill")
                                .renderingMode(.original)
                                .font(.system(.title))
                            Text("Sunrise")
                            Text("\(globalVars.sunrise)")
                                .font(.system(size: timeFont, weight: .bold))
                        }
                        
                        Spacer()
                        
                        VStack {
                            Image(systemName: "sun.max.fill")
                                .renderingMode(.original)
                                .font(.system(.title))
                            Text("Daylight")
                            Text("\(globalVars.daylight)")
                                .font(.system(size: timeFont, weight: .bold))
                        }
                        
                        Spacer()
                        
                        VStack {
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
                
                VStack {
                    Text("Day Over Day")
                        .font(.system(size: sectionTitleSize, weight: .bold))
                        .padding(.bottom)
                    HStack {
                        VStack {
                            Image(systemName: "sunrise.fill")
                                .renderingMode(.original)
                                .font(.system(.title))
                            Text("Sunrise")
                            Text("\(abs(Int(globalVars.sunriseChange)!)) min")
                                .font(.system(size: timeFont, weight: .bold))
                            Text("\(Int(globalVars.sunriseChange)! > 0 ? "Later" : "Earlier" )")
                        }
                        
                        Spacer()
                        
                        VStack {
                            Image(systemName: "sun.max.fill")
                                .renderingMode(.original)
                                .font(.system(.title))
                            Text("Daylight")
                            Text("\(abs(Int(globalVars.daylightChange)!)) min")
                                .font(.system(size: timeFont, weight: .bold))
                            Text("\(Int(globalVars.daylightChange)! > 0 ? "More" : "Less" )")
                        }
                        
                        Spacer()
                        
                        VStack {
                            Image(systemName: "sunset.fill")
                                .renderingMode(.original)
                                .font(.system(.title))
                            Text("Sunset")
                            Text("\(abs(Int(globalVars.sunsetChange)!)) min")
                                .font(.system(size: timeFont, weight: .bold))
                            Text("\(Int(globalVars.sunsetChange)! > 0 ? "Later" : "Earlier" )")
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
