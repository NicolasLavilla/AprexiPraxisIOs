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
    
    func getListFollowOffer(idUser: Int, token: String) async throws -> ListFollowOffer {
        return .example
    }
    
    func getListRequestOffer(idUser: Int, token: String) async throws -> ListRequestOffer {
        return .example
    }
    
    func getListDetailRequestOffer(idUser: Int, idOffer: Int, token: String) async throws -> ListDetailRequestOffer {
        return .example
    }
    
    func setInsertFollowOffer(idUser: Int, idOffer: Int, token: String) async throws -> InsertFollowOfferUser {
        return .example
    }
    
    func setDeleteFollowOffer(idUser: Int, idOffer: Int, token: String) async throws -> DeleteFollowOfferUser {
        return .example
    }
    
    func setInsertRequestOffer(idUser: Int, idOffer: Int, token: String) async throws -> InsertRequestOfferUser {
        return .example
    }
}
