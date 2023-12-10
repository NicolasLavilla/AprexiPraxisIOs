//
//  LicenseRepository.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//

import Foundation

struct LicenseRepository {
    private let remoteService: LicenseRemoteService
    
    init(remoteService: LicenseRemoteService) {
        self.remoteService = remoteService
    }
    
    func getListLicenseUser(idUser: Int, token: String) async throws -> ListLicenseUser {
        return try await remoteService.getListLicenseUser(idUser: idUser, token: token)
    }
}
