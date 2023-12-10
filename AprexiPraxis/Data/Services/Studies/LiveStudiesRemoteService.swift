//
//  LiveStudiesRemoteService.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//
import Foundation

struct LiveStudiesRemoteService: StudiesRemoteService {
    
    let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getListStudiesUser(idUser: Int, token: String) async throws -> ListStudiesUser{
        let queryParams: [String: String] = [
            "idUser": String(idUser),
            "token": token
        ]
    return try await networkClient.getCall(url: NetworkConstants.listStudiesUser, queryParams: queryParams)
    }

}
