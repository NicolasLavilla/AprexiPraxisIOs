//
//  LanguagesRepository.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//

import Foundation

struct LanguagesRepository {
    private let remoteService: LanguagesRemoteService
    
    init(remoteService: LanguagesRemoteService) {
        self.remoteService = remoteService
    }
    
    func getListLanguagesUser(idUser: Int, token: String) async throws -> ListLanguagesUser {
        return try await remoteService.getListLanguagesUser(idUser: idUser, token: token)
    }
}
