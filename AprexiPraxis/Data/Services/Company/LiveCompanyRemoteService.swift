//
//  LiveCompanyRemoteService.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//

import Foundation

struct LiveCompanyRemoteService: CompanyRemoteService {
    
    let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getCompany(idUser: Int, idCompany: Int, token: String) async throws -> Company{
        let queryParams: [String: String] = [
            "idUser": String(idUser),
            "idCompany": String(idCompany),
            "token": token
        ]
    return try await networkClient.getCall(url: NetworkConstants.companyNetworkUrl, queryParams: queryParams)
    }

}
