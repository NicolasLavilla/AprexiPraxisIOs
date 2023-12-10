//
//  RequestOfferDetailViewModel.swift
//  AprexiPraxis
//
//  Created by user245647 on 9/12/23.
//

import Foundation

class RequestOfferDetailViewModel: ObservableObject {
    
    private let offerCompanyRepository: OfferCompanyRepository
    
    @Published var isLoading = false
    @Published var listDetailRequestOffer: ListDetailRequestOffer = ListDetailRequestOffer.example
    @Published var error: Error?
    
    init(offerCompanyRepository: OfferCompanyRepository) {
        self.offerCompanyRepository = offerCompanyRepository
    }
    
    @MainActor
    func getListDetailRequestOffer(idUser: Int, idOffer: Int, token: String) async {
        error = nil
        isLoading = true
        
        do {
            listDetailRequestOffer = try await offerCompanyRepository.getListDetailRequestOffer(idUser: idUser, idOffer: idOffer, token: token)
        } catch {
            print("Error:", error)
            self.error = error
        }

        
        isLoading = false
    }
}
