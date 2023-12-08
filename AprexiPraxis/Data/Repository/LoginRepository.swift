//
//  LoginRepository.swift
//  AprexiPraxis
//
//  Created by user245647 on 2/12/23.
//


import Foundation

struct LoginRepository {
    private let remoteService: LoginRemoteService
    
    init(remoteService: LoginRemoteService) {
        self.remoteService = remoteService
    }
    
    func getLogin(email: String, password: String) async throws -> Login {
        return try await remoteService.getLogin(email: email, password: password)
    }
}
