//
//  StudiesRemoteService.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//

import Foundation

protocol StudiesRemoteService {
    func getListStudiesUser(idUser: Int, token: String) async throws -> ListStudiesUser
}
