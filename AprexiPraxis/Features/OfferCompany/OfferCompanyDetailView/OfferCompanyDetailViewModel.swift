//
//  OfferCompanyDetailViewModel.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//

import Foundation

class OfferCompanyDetailViewModel: ObservableObject {
    
    private let offerCompanyRepository: OfferCompanyRepository
    
    @Published var isLoading = false
    @Published var offer: Offer?
    @Published var error: Error?
    
    init(offerCompanyRepository: OfferCompanyRepository) {
        self.offerCompanyRepository = offerCompanyRepository
    }
    
    @MainActor
    func getOfferCompany(idOffer: Int,idUser: Int, token: String) async {
        error = nil
        isLoading = true
        
        do {
            offer = try await offerCompanyRepository.getOfferCompany(idOffer: idOffer ,idUser: idUser, token: token)
            if let unwrappedOffer = offer {
                print("Esto es offer: ", unwrappedOffer)
            } else {
                print("Esto es offer: jaja")
            }
            
        } catch {
            self.error = error
        }
        
        isLoading = false
    }
}
