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
                    Label("Offers", systemImage: "list.star")
                }
            coordinator.makeFollowOfferMainView(idUser: idUser, token: token)
                .tabItem {
                    Label("Follow Offers", systemImage: "heart")
                }
            coordinator.makeRequestOfferMainView(idUser: idUser, token: token)
                .tabItem {
                    Label("Request Offers", systemImage: "rectangle.and.text.magnifyingglass")
                }
            
            coordinator.makeCurriculumView(idUser: idUser, token: token)
                .tabItem {
                    Label("Curriculum", systemImage: "person.crop.rectangle")
                }
        }
    } 
}

#Preview {

    let coordinator = Coordinator(mock: true)
    return ContentView( idUser: 4, token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6Ik1hcmlhIiwiZXhwIjoxNzAyNDYyNjE5LCJraWQiOiJraWRfNjU3OTc2OGJmMzA5YjMuMjQwODI1MjkifQ.xCCziaCuVCF3ZLMwynbnSfo6up54YtHKLLo_6lvglxc")
        .environmentObject(coordinator)
}
