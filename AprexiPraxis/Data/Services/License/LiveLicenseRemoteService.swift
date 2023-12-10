//
//  LiveLicenseRemoteService.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//

import Foundation

struct LiveLicenseRemoteService: LicenseRemoteService {
    
    let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getListLicenseUser(idUser: Int, token: String) async throws -> ListLicenseUser{
        let queryParams: [String: String] = [
            "idUser": String(idUser),
            "token": token
        ]
    return try await networkClient.getCall(url: NetworkConstants.listLicenseUser, queryParams: queryParams)
    }

}
