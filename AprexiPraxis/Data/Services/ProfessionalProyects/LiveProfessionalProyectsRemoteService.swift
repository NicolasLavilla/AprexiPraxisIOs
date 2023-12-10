//
//  LiveProfessionalProyectsRemoteService.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//

import Foundation

struct LiveProfessionalProyectsRemoteService: ProfessionalProyectsRemoteService {
    
    let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getListProfessionalProyectsUser(idUser: Int, token: String) async throws -> ListProfessionalProyectsUser{
        let queryParams: [String: String] = [
            "idUser": String(idUser),
            "token": token
        ]
    return try await networkClient.getCall(url: NetworkConstants.listProfessionalProyectsUser, queryParams: queryParams)
    }

}
