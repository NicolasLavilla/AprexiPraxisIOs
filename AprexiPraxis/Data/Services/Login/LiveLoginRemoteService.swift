//
//  LiveLoginRemoteService.swift
//  AprexiPraxis
//
//  Created by user245647 on 2/12/23.
//

import Foundation

struct LiveLoginRemoteService: LoginRemoteService {
    
    let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getLogin(email: String, password: String) async throws -> Login {
        let queryParams: [String: String] = [
            "email": email,
            "password": password
        ]
        
        return try await networkClient.getCall(url: NetworkConstants.loginNetworkUrl, queryParams: queryParams)
    }
}
