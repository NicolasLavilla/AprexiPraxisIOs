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
}
