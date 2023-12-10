//
//  RequestOfferView.swift
//  AprexiPraxis
//
//  Created by user245647 on 9/12/23.
//

import SwiftUI

struct RequestOfferView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var viewModel: RequestOfferViewModel
     
     init(idUser: Int, token: String) {
         _viewModel = StateObject(wrappedValue: RequestOfferViewModel(offerCompanyRepository: OfferCompanyRepository(remoteService: LiveOfferCompanyRemoteService(networkClient: URLSessionNetworkClient()))))
         

         self.idUser = idUser
         self.token = token
     }
     
     private let idUser: Int
     private let token: String
    
    var body: some View {
        NavigationStack {
            if let requests = viewModel.listRequestOffer?.requestOffer, !requests.isEmpty {
                List {
                    ForEach(requests) { requestOffer in
                        makeGoToOfferCompanyDetailNavigationLink(for: requestOffer)
                    }
                }
                .navigationTitle("Request Offers")
                .task {
                    await viewModel.getListRequestOffer(idUser: idUser, token: token)
                }
            } else {
                VStack {
                    Text("No hay ofertas de solicitud disponibles")
                        .foregroundColor(.gray)
                }
                .navigationTitle("Request Offers")
                .task {
                    await viewModel.getListRequestOffer(idUser: idUser, token: token)
                }
            }
        }
    }

    private func makeGoToOfferCompanyDetailNavigationLink(for requestOffer: RequestOffer) -> some View {
        NavigationLink {
            coordinator.makeRequestOfferDetailView(idUser: idUser, idOffer: requestOffer.idOffer, token: token)
        } label: {
            RequestOfferRowView(requestOffer: requestOffer)
        }
    }

}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeRequestOfferMainView(idUser: 4, token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6Ik1hcmlhIiwiZXhwIjoxNzAyMzg1NDYzLCJraWQiOiJraWRfNjU3ODQ5Mjc1NzcxYjAuMDA1NDIwNjkifQ._IhI04w17dXKtO3jzQwLXj7msRQry48hX2HwVHs0m0I")
        .environmentObject(coordinator)
}
