//
//  Token.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//

import Foundation

// MARK: - CheckToken
struct CheckToken: Decodable {
    let checkToken: Bool
    let message: String
    
    static var example: CheckToken {
        return CheckToken(
            checkToken: false,
            message: "Token inválido"
        )
    }
}
