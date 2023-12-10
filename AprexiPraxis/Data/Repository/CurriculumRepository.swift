//
//  CurriculumRepository.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//

import Foundation

struct CurriculumRepository {
    private let remoteService: CurriculumRemoteService
    
    init(remoteService: CurriculumRemoteService) {
        self.remoteService = remoteService
    }
    
    func getUser(idUser: Int, token: String) async throws -> User {
        return try await remoteService.getUser(idUser: idUser, token: token)
    }
}
