//
//  MockOfferCompanyRemoteService.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//

import Foundation

struct MockOfferCompanyRemoteService: OfferCompanyRemoteService {
    func getListOfferCompany(idUser: Int, token: String) async throws -> ListOfferCompany {
        return .example
    }
    
    func getOfferCompany(idOffer: Int, idUser: Int, token: String) async throws -> Offer {
        return .example
    }
}
