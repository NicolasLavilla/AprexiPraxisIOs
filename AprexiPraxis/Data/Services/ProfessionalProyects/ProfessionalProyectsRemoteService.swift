//
//  ProfessionalProyectsRemoteService.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//

import Foundation

protocol ProfessionalProyectsRemoteService {
    func getListProfessionalProyectsUser(idUser: Int, token: String) async throws -> ListProfessionalProyectsUser
}
