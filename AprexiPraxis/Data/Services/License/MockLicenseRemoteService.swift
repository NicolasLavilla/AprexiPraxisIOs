//
//  MockLicenseRemoteService.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//

import Foundation

struct MockLicenseRemoteService: LicenseRemoteService {
    
    func getListLicenseUser(idUser: Int, token: String) async throws -> ListLicenseUser{
        return .example
    }
}
