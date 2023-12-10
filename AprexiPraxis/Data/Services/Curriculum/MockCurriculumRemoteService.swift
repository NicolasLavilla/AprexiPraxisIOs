//
//  MockCurriculumRemoteService.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//


import Foundation

struct MockCurriculumRemoteService: CurriculumRemoteService {
    
    func getUser(idUser: Int, token: String) async throws -> User{
        return .example
    }
}
