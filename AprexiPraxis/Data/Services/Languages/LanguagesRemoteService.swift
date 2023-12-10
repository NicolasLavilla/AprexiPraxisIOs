//
//  LanguagesRemoteService.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//

import Foundation

protocol LanguagesRemoteService {
    func getListLanguagesUser(idUser: Int, token: String) async throws -> ListLanguagesUser
}
