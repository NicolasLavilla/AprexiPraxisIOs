//
//  ExperienceRemoteService.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//

import Foundation

protocol ExperienceRemoteService {
    func getListExperienceJobUser(idUser: Int, token: String) async throws -> ListExperienceJobUser
}
