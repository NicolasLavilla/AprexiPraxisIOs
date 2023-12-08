//
//  ContentView.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var coordinator: Coordinator
    
    init( idUser: Int, token: String) {
        
        self.idUser = idUser
        self.token = token
    }

    private let idUser: Int
    private let token: String
   
    
    var body: some View {
        TabView {
            
            coordinator.makeOfferCompanyMainView(idUser: idUser, token: token)
                .tabItem {
                    Label("CV", systemImage: "star")
                }
        }
    }
}

#Preview {
    ContentView( idUser: 4, token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo4MywidXNlcm5hbWUiOiJNYXJpbyIsImV4cCI6MTcwMjAyODAyMSwia2lkIjoia2lkXzY1NzJkNGU1OGY4OWE2LjM0MDc1NDk5In0.IxoOL9Cvfau-ZLY5MoYACCHOVjXGDqOh08QM1-DUYMc")
    
}
