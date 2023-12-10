//
//  LiveLanguageRemoteService.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//

import Foundation

struct LiveLanguagesRemoteService: LanguagesRemoteService {
    
    let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getListLanguagesUser(idUser: Int, token: String) async throws -> ListLanguagesUser{
        let queryParams: [String: String] = [
            "idUser": String(idUser),
            "token": token
        ]
    return try await networkClient.getCall(url: NetworkConstants.listLanguagesUser, queryParams: queryParams)
    }

}
