//
//  LiveTokenRemoteService.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//
import Foundation

struct LiveTokenRemoteService: TokenRemoteService {

    
    let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getCheckToken() async throws -> CheckToken {
        
        return try await networkClient.getCall(url: NetworkConstants.loginNetworkUrl, queryParams: nil)
    }
}

/*    func getCheckToken() async throws -> CheckToken {
 let response: APIResponse<CheckToken> = try await networkClient.getCall(url: NetworkConstants.loginNetworkUrl, queryParams: nil)
 
 return response.results
}
*/
