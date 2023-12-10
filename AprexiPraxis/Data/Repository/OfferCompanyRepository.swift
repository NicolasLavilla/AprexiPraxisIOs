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
    
    func getListFollowOffer( idUser: Int, token: String) async throws -> ListFollowOffer {
        return try await remoteService.getListFollowOffer(idUser: idUser, token: token)
    }
    
    func getListRequestOffer( idUser: Int, token: String) async throws -> ListRequestOffer {
        return try await remoteService.getListRequestOffer(idUser: idUser, token: token)
    }
    
    func getListDetailRequestOffer(idUser: Int, idOffer: Int, token: String) async throws -> ListDetailRequestOffer {
        return try await remoteService.getListDetailRequestOffer(idUser: idUser, idOffer: idOffer, token: token)
    }
    
    func setInsertFollowOffer(idUser: Int, idOffer: Int, token: String) async throws -> InsertFollowOfferUser {
        return try await remoteService.setInsertFollowOffer(idUser: idUser, idOffer: idOffer, token: token)
    }
    
    func setDeleteFollowOffer(idUser: Int, idOffer: Int, token: String) async throws -> DeleteFollowOfferUser {
        return try await remoteService.setDeleteFollowOffer(idUser: idUser, idOffer: idOffer, token: token)
    }
    
    func setInsertRequestOffer(idUser: Int, idOffer: Int, token: String) async throws -> InsertRequestOfferUser {
        return try await remoteService.setInsertRequestOffer(idUser: idUser, idOffer: idOffer, token: token)
    }
}
