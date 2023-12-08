//
//  OfferCompanyViewModel.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//

import Foundation

class OfferCompanyViewModel: ObservableObject {
    private let offerCompanyRepository: OfferCompanyRepository
    
    @Published var isLoading = false
    @Published var listOfferCompany: ListOfferCompany?
    @Published var error: Error?
    
    init(offerCompanyRepository: OfferCompanyRepository) {
        self.offerCompanyRepository = offerCompanyRepository
    }
    
    @MainActor
    func getListOfferCompany(idUser: Int, token: String) async {
        error = nil
        isLoading = true
        
        do {
            listOfferCompany = try await offerCompanyRepository.getListOfferCompany(idUser: idUser, token: token)
            if let unwrappedOffer = listOfferCompany {
                            print("Esto es offer: ", unwrappedOffer)
                        } else {
                            print("Esto es offer: jaja")
                        }
        } catch(let error) {
            self.error = error
        }
        
        isLoading = false
    }
}
