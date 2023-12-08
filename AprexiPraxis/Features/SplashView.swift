//
//  SplashActivity.swift
//  AprexiPraxis
//
//  Created by user245647 on 2/12/23.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false

    var body: some View {
        Text("Aprexi")
            .font(.largeTitle)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    self.isActive = true
                }
            }
            .fullScreenCover(isPresented: $isActive, content: {
                LoginView()
            })
    }
}


#Preview {
    SplashView()
}
