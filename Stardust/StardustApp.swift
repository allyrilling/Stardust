//
//  StardustApp.swift
//  Stardust
//
//  Created by Ally Rilling on 8/6/21.
//

import SwiftUI

@main
struct StardustApp: App {
    var body: some Scene {
        WindowGroup {
            let globalVars = GlobalVars()
            MainView(globalVars: globalVars)
        }
    }
}
