//
//  StudiesRepository.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//

import Foundation

struct StudiesRepository {
    private let remoteService: StudiesRemoteService
    
    init(remoteService: StudiesRemoteService) {
        self.remoteService = remoteService
    }
    
    func getListStudiesUser(idUser: Int, token: String) async throws -> ListStudiesUser {
        return try await remoteService.getListStudiesUser(idUser: idUser, token: token)
    }
}
