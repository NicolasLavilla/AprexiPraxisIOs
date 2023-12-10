//
//  OfferCompanyRemoteService.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//

import Foundation

protocol OfferCompanyRemoteService {
    func getListOfferCompany(idUser: Int, token: String) async throws -> ListOfferCompany
    func getOfferCompany(idOffer: Int, idUser: Int, token: String) async throws -> Offer
    func getListFollowOffer(idUser: Int, token: String) async throws -> ListFollowOffer
    func getListRequestOffer(idUser: Int, token: String) async throws -> ListRequestOffer
    func getListDetailRequestOffer(idUser: Int, idOffer: Int, token: String) async throws -> ListDetailRequestOffer
    func setInsertFollowOffer(idUser: Int, idOffer: Int, token: String) async throws -> InsertFollowOfferUser
    func setDeleteFollowOffer(idUser: Int, idOffer: Int, token: String) async throws -> DeleteFollowOfferUser
    func setInsertRequestOffer(idUser: Int, idOffer: Int, token: String) async throws -> InsertRequestOfferUser
    
    
}
