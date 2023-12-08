//
//  TokenRemoteService.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//

import Foundation

protocol TokenRemoteService {
    func getCheckToken() async throws -> CheckToken
}
