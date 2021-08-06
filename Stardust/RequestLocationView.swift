//
//  RequestLocationView.swift
//  RequestLocationView
//
//  Created by Ally Rilling on 8/3/21.
//

import SwiftUI

struct RequestLocationView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
    
    var body: some View {
        VStack {
            Image(systemName: "location.circle")
                .resizable()
                .foregroundColor(.white)
                .frame(width: 100, height: 100, alignment: .center)
            Button(action: {
                locationViewModel.requestPermission()
            }, label: {
                Label("Turn on Location Permissions", systemImage: "location")
            })
                .padding(10)
                .foregroundColor(.blue)
                .background(Color.white.cornerRadius(10))
                .padding(.vertical)
            Text("To start using the app, please allow access your location.")
                .multilineTextAlignment(.center)
        }
            .padding()
            .background(Color.blue.cornerRadius(20))
            .padding()
    }
}

