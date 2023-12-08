//
//  MockLoginRemoteService.swift
//  AprexiPraxis
//
//  Created by user245647 on 2/12/23.
//

import Foundation

struct MockLoginRemoteService: LoginRemoteService {
    func getLogin(email: String, password: String) async throws -> Login {
        return .example
    }
}
