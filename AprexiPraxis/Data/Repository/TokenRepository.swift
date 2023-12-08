//
//  TokenRepository.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//

import SwiftUI

struct TokenRepository {
    private let remoteService: TokenRemoteService
    
    init(remoteService: TokenRemoteService) {
        self.remoteService = remoteService
    }
    
    func getCheckToken() async throws -> CheckToken {
        return try await remoteService.getCheckToken()
    }
}
