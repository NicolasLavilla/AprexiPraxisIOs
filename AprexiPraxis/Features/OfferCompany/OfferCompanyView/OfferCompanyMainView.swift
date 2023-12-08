//
//  OfferCompanyView.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//
import SwiftUI

struct OfferCompanyMainView: View {
    @StateObject private var viewModel: OfferCompanyViewModel
    @State private var offers: [Offer] = []

    init(idUser: Int, token: String) {
        _viewModel = StateObject(wrappedValue: OfferCompanyViewModel(offerCompanyRepository: OfferCompanyRepository(remoteService: LiveOfferCompanyRemoteService(networkClient: URLSessionNetworkClient()))))
        self.idUser = idUser
        self.token = token
    }

    private let idUser: Int
    private let token: String

    var body: some View {
        NavigationView {
            List(offers, id: \.idOffer) { offer in
                NavigationLink(destination: OfferCompanyDetailView(idOffer: offer.idOffer, idUser: idUser, token: token)) {
                    VStack(alignment: .leading) {
                        Text(offer.offerTitle)
                            .font(.headline)
                        Text(offer.nameCompany)
                    }
                }
            }

            .navigationBarTitle("Ofertas")
            .onAppear {
                fetchOffers()
            }
            .onReceive(viewModel.$listOfferCompany) { listOfferCompany in
                if let unwrappedListOfferCompany = listOfferCompany {
                    offers = unwrappedListOfferCompany.offer
                } else {
                    offers = [] // No offers available, reset the offers
                    print("No offers available")
                    // Handle case when no offers are available
                }
            }
            .onReceive(viewModel.$error) { error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    // Handle error appropriately
                }
            }
        }
    }

    private func fetchOffers() {
        Task {
            await viewModel.getListOfferCompany(idUser: idUser, token: token)
        }
    }
}

#Preview {
    OfferCompanyMainView(idUser: 4, token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo4MywidXNlcm5hbWUiOiJNYXJpbyIsImV4cCI6MTcwMjAyODAyMSwia2lkIjoia2lkXzY1NzJkNGU1OGY4OWE2LjM0MDc1NDk5In0.IxoOL9Cvfau-ZLY5MoYACCHOVjXGDqOh08QM1-DUYMc")
}
