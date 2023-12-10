//
//  CompanyRepository.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//

import Foundation

struct CompanyRepository {
    private let remoteService: CompanyRemoteService
    
    init(remoteService: CompanyRemoteService) {
        self.remoteService = remoteService
    }
    
    func getCompany(idUser: Int, idCompany: Int, token: String) async throws -> Company {
        return try await remoteService.getCompany(idUser: idUser, idCompany: idCompany, token: token)
    }
    
    
}
