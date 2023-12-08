//
//  OfferCompanyRepository.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//

import Foundation

struct OfferCompanyRepository {
    private let remoteService: OfferCompanyRemoteService
    
    init(remoteService: OfferCompanyRemoteService) {
        self.remoteService = remoteService
    }
    
    func getListOfferCompany(idUser: Int, token: String) async throws -> ListOfferCompany {
        return try await remoteService.getListOfferCompany(idUser: idUser, token: token)
    }
    
    func getOfferCompany(idOffer: Int, idUser: Int, token: String) async throws -> Offer {
        return try await remoteService.getOfferCompany(idOffer: idOffer, idUser: idUser, token: token)
        
    }

}
