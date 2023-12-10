//
//  FollowOfferViewModel.swift
//  AprexiPraxis
//
//  Created by user245647 on 9/12/23.
//

import Foundation

class FollowOfferViewModel: ObservableObject {
    private let offerCompanyRepository: OfferCompanyRepository
    
    @Published var isLoading = false
    @Published var listFollowOffer: ListFollowOffer?
    @Published var error: Error?
    
    init(offerCompanyRepository: OfferCompanyRepository) {
        self.offerCompanyRepository = offerCompanyRepository
    }
    
    @MainActor
    func getListFollowOffer(idUser: Int, token: String) async {
        error = nil
        isLoading = true
        
        do {
            listFollowOffer = try await offerCompanyRepository.getListFollowOffer(idUser: idUser, token: token)
        
        } catch(let error) {
            print("Error:", error)
            self.error = error
        }
        
        isLoading = false
    }
}
