//
//  CurriculumRemoteService.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//

import Foundation

protocol CurriculumRemoteService {
    func getUser(idUser: Int, token: String) async throws -> User
}
