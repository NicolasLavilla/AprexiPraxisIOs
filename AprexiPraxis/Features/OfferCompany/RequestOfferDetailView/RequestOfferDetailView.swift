//
//  RequestOfferDetailView.swift
//  AprexiPraxis
//
//  Created by user245647 on 9/12/23.
//

import SwiftUI

struct RequestOfferDetailView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var viewModel: RequestOfferDetailViewModel
     
    init(idUser: Int, idOffer: Int, token: String) {
         _viewModel = StateObject(wrappedValue: RequestOfferDetailViewModel(offerCompanyRepository: OfferCompanyRepository(remoteService: LiveOfferCompanyRemoteService(networkClient: URLSessionNetworkClient()))))
         
         self.idUser = idUser
         self.idOffer = idOffer
         self.token = token
     }
    
     private let idUser: Int
     private let idOffer: Int
     private let token: String
    
    var body: some View {
        NavigationStack {
            List(viewModel.listDetailRequestOffer.detailRequestOffer) { detailRequestOffer in
        
                RequestOfferDetailRowView(detailRequestOffer: detailRequestOffer)
                
               // makeGoToOfferCompanyDetailNavigationLink(for: detailRequestOffer)
            }
            .navigationTitle("List Detail Request Offers")
            .task {
                await viewModel.getListDetailRequestOffer(idUser: idUser, idOffer: idOffer, token: token)
            }
        }
    }
    
}


#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeRequestOfferDetailView(idUser: 4, idOffer: 4, token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6Ik1hcmlhIiwiZXhwIjoxNzAyMzgxNjcyLCJraWQiOiJraWRfNjU3ODNhNThjNDk4MDIuMjM2OTA3NzAifQ.7r2CJJmugRlHg4VnY6AKwrHcRsG-0IrZU7TysrpQ-r0")
        .environmentObject(coordinator)
}
