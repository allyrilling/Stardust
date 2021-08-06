//
//  ErrorView.swift
//  ErrorView
//
//  Created by Ally Rilling on 8/3/21.
//

import SwiftUI

struct ErrorView: View {
    var errorText: String
    
    var body: some View {
        VStack {
            Image(systemName: "location.slash.fill")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
            Text((errorText.split(separator: "."))[0] + ".")
                .font(.system(.title2))
                .multilineTextAlignment(.center)
                .padding(.vertical)
            Text((errorText.split(separator: "."))[1] + ".")
                .multilineTextAlignment(.center)
        }
        .padding()
        .background(Color.red.cornerRadius(20))
        .padding()
    }
}
