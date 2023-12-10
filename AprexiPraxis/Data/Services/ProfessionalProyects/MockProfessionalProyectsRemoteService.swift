//
//  MockProfessionalProyectsRemoteService.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//

import Foundation

struct MockProfessionalProyectsRemoteService: ProfessionalProyectsRemoteService {
    
    func getListProfessionalProyectsUser(idUser: Int, token: String) async throws -> ListProfessionalProyectsUser{
        return .example
    }
}
