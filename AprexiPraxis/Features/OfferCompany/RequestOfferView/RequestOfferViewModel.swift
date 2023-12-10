//
//  RequestOfferViewModel.swift
//  AprexiPraxis
//
//  Created by user245647 on 9/12/23.
//


import Foundation

class RequestOfferViewModel: ObservableObject {
    private let offerCompanyRepository: OfferCompanyRepository
    
    @Published var isLoading = false
    @Published var listRequestOffer: ListRequestOffer?
    @Published var error: Error?
    
    init(offerCompanyRepository: OfferCompanyRepository) {
        self.offerCompanyRepository = offerCompanyRepository
    }
    
    @MainActor
    func getListRequestOffer(idUser: Int, token: String) async {
        error = nil
        isLoading = true
        
        do {
            listRequestOffer = try await offerCompanyRepository.getListRequestOffer(idUser: idUser, token: token)
        
        } catch(let error) {
            print("Error:", error)
            self.error = error
        }
        
        isLoading = false
    }
}
