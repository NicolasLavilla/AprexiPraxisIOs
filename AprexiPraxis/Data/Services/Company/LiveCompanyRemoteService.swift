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
    
    func getCompany() async throws -> [Company] {
        let response: APIResponse<Company> = try await networkClient.getCall(url: NetworkConstants.companyNetworkUrl, queryParams: nil)
        
        return response.results
    }
}
