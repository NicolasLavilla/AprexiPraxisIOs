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
    
    func getListFollowOffer (idUser: Int, token: String) async throws -> ListFollowOffer {
        let queryParams: [String: String] = [
            "idUser": String(idUser),
            "token": token
        ]
        
        return try await networkClient.getCall(url: NetworkConstants.listFollowOfferNetworkUrl, queryParams: queryParams)
    }
    
    func getListRequestOffer (idUser: Int, token: String) async throws -> ListRequestOffer {
        let queryParams: [String: String] = [
            "idUser": String(idUser),
            "token": token
        ]
        
        return try await networkClient.getCall(url: NetworkConstants.listRequestOfferNetworkUrl, queryParams: queryParams)
    }
    
    
    func getListDetailRequestOffer (idUser: Int, idOffer: Int, token: String) async throws -> ListDetailRequestOffer {
        let queryParams: [String: String] = [
            "idUser": String(idUser),
            "idOffer": String(idOffer),
            "token": token
        ]
        
        return try await networkClient.getCall(url: NetworkConstants.listDetailRequestOfferNetworkUrl, queryParams: queryParams)
    }
    
    func setInsertFollowOffer (idUser: Int, idOffer: Int, token: String) async throws -> InsertFollowOfferUser {
        let queryParams: [String: String] = [
            "idUser": String(idUser),
            "idOffer": String(idOffer),
            "token": token
        ]
        
        return try await networkClient.getCall(url: NetworkConstants.followOfferUser, queryParams: queryParams)
    }
    
    func setDeleteFollowOffer (idUser: Int, idOffer: Int, token: String) async throws -> DeleteFollowOfferUser {
        let queryParams: [String: String] = [
            "idUser": String(idUser),
            "idOffer": String(idOffer),
            "token": token
        ]
        
        return try await networkClient.getCall(url: NetworkConstants.deleteFollowOfferUser, queryParams: queryParams)
    }
    
    func setInsertRequestOffer (idUser: Int, idOffer: Int, token: String) async throws -> InsertRequestOfferUser {
        let queryParams: [String: String] = [
            "idUser": String(idUser),
            "idOffer": String(idOffer),
            "token": token
        ]
        
        return try await networkClient.getCall(url: NetworkConstants.requestOfferUser, queryParams: queryParams)
    }
}
