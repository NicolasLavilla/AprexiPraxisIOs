//
//  AprexiPraxisApp.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//

import SwiftUI

@main
struct AprexiPraxisApp: App {
    let coordinator = Coordinator()
    
    var body: some Scene {
        WindowGroup {
            SplashView().environmentObject(coordinator)
        }
    }
}
