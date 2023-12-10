//
//  ProfessionalProyectsRepository.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//

import Foundation

struct ProfessionalProyectsRepository {
    private let remoteService: ProfessionalProyectsRemoteService
    
    init(remoteService: ProfessionalProyectsRemoteService) {
        self.remoteService = remoteService
    }
    
    func getListProfessionalProyectsUser(idUser: Int, token: String) async throws -> ListProfessionalProyectsUser {
        return try await remoteService.getListProfessionalProyectsUser(idUser: idUser, token: token)
    }
}
