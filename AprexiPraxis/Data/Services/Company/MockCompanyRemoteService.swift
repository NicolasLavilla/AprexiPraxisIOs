//
//  MockCompanyRemoteService.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//

import Foundation

struct MockCompanyRemoteService: CompanyRemoteService {
    
    func getCompany() async throws -> [Company] {
        return [.example, .example, .example]
    }
}
