//
//  ExperienceRepository.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//

import Foundation

struct ExperienceRepository {
    private let remoteService: ExperienceRemoteService
    
    init(remoteService: ExperienceRemoteService) {
        self.remoteService = remoteService
    }
    
    func getListExperienceJobUser(idUser: Int, token: String) async throws -> ListExperienceJobUser {
        return try await remoteService.getListExperienceJobUser(idUser: idUser, token: token)
    }
}
