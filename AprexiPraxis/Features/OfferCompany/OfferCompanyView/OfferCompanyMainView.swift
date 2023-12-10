//
//  OfferCompanyView.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//
import SwiftUI

struct OfferCompanyMainView: View {
    @StateObject private var viewModel: OfferCompanyViewModel
    @EnvironmentObject var coordinator: Coordinator
    
    init(idUser: Int, token: String) {
        _viewModel = StateObject(wrappedValue: OfferCompanyViewModel(offerCompanyRepository: OfferCompanyRepository(remoteService: LiveOfferCompanyRemoteService(networkClient: URLSessionNetworkClient()))))
        self.idUser = idUser
        self.token = token
    }
    
    private let idUser: Int
    private let token: String
    
    var body: some View {
        NavigationStack {
            if let offers = viewModel.listOfferCompany?.offer, !offers.isEmpty {
                List {
                    ForEach(offers) { offer in
                        makeGoToOfferCompanyDetailNavigationLink(for: offer)
                    }
                }
                .navigationTitle("List Offers")
                .task {
                    await viewModel.getListOfferCompany(idUser: idUser, token: token)
                }
            } else {
                VStack {
                    Text("No hay ofertas disponibles")
                        .foregroundColor(.gray)
                }
                .navigationTitle("List Offers")
                .task {
                    await viewModel.getListOfferCompany(idUser: idUser, token: token)
                }
            }
        }
    }
    
    private func makeGoToOfferCompanyDetailNavigationLink(for offer: Offer) -> some View {
        NavigationLink {
            coordinator.makeOfferCompanyDetailView(idOffer: offer.idOffer, idUser: idUser, token: token)
        } label: {
            OfferCompanyRowView(offer: offer)
        }
    }
    
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeOfferCompanyMainView( idUser: 4, token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6Ik1hcmlhIiwiZXhwIjoxNzAyMzg1NDYzLCJraWQiOiJraWRfNjU3ODQ5Mjc1NzcxYjAuMDA1NDIwNjkifQ._IhI04w17dXKtO3jzQwLXj7msRQry48hX2HwVHs0m0I")
        .environmentObject(coordinator)
}
