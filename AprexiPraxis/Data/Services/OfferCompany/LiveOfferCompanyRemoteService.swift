//
//  LiveOfferCompanyRemoteService.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//


import Foundation

struct LiveOfferCompanyRemoteService: OfferCompanyRemoteService {
    
    let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getListOfferCompany(idUser: Int, token: String) async throws -> ListOfferCompany {
        let queryParams: [String: String] = [
            "idUser": String(idUser),
            "token": token
        ]
        
        return try await networkClient.getCall(url: NetworkConstants.listOfferCompanyNetworkUrl, queryParams: queryParams)
    }

    
    func getOfferCompany(idOffer: Int, idUser: Int, token: String) async throws -> Offer {
        let queryParams: [String: String] = [
            "idOffer": String(idOffer),
            "idUser": String(idUser),
            "token": token
        ]
        
        return try await networkClient.getCall(url: NetworkConstants.getOfferCompanyNetworkUrl, queryParams: queryParams)
    }
}
