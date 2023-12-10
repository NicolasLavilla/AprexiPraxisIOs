//
//  MockCompanyRemoteService.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//

import Foundation

struct MockCompanyRemoteService: CompanyRemoteService {
    
    func getCompany(idUser: Int, idCompany: Int, token: String) async throws -> Company {
        return .example
    }
}
