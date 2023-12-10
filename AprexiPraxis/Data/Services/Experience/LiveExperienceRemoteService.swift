//
//  LiveExperienceRemoteService.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//

import Foundation

struct LiveExperienceRemoteService: ExperienceRemoteService {
    
    let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getListExperienceJobUser(idUser: Int, token: String) async throws -> ListExperienceJobUser{
        let queryParams: [String: String] = [
            "idUser": String(idUser),
            "token": token
        ]
    return try await networkClient.getCall(url: NetworkConstants.listExperienceJobUser, queryParams: queryParams)
    }

}
