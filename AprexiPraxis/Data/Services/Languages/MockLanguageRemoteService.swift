//
//  MockLanguageRemoteService.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//

import Foundation

struct MockLanguagesRemoteService: LanguagesRemoteService {
    
    func getListLanguagesUser(idUser: Int, token: String) async throws -> ListLanguagesUser{
        return .example
    }
}
