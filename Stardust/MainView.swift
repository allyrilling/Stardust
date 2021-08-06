//
//  MainView.swift
//  MainView
//
//  Created by Ally Rilling on 7/30/21.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var globalVars: GlobalVars
    
    @StateObject var locationViewModel = LocationViewModel()
    
    var body: some View {
        
        switch locationViewModel.authorizationStatus {
        case .notDetermined:
            AnyView(RequestLocationView())
                .environmentObject(locationViewModel)
        case .restricted:
            ErrorView(errorText: "Location use is restricted.")
        case .denied:
            ErrorView(errorText: "This app does not have access to location data. To enable location permissions go to Settings -> Lightsaber -> Location and choose \"While Using the App\"")
        case .authorizedAlways, .authorizedWhenInUse:
//            TestView()
            TrackingView(globalVars: globalVars)
                .environmentObject(locationViewModel)
                .onChange(of: locationViewModel.lastSeenLocation?.coordinate.longitude, perform: { (value) in
                    Logic.queryAPI(globalVars: globalVars, locationViewModel: locationViewModel)
                })
        default:
            Text("Unexpected status")
        }
    }
    
}






