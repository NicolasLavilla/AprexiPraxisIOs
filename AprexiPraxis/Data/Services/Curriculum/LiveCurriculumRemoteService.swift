//
//  LiveCurriculumRemoteService.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//

import Foundation

struct LiveCurriculumRemoteService: CurriculumRemoteService {
    
    let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getUser(idUser: Int, token: String) async throws -> User{
        let queryParams: [String: String] = [
            "idUser": String(idUser),
            "token": token
        ]
    return try await networkClient.getCall(url: NetworkConstants.user, queryParams: queryParams)
    }

}
