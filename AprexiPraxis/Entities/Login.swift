//
//  Login.swift
//  AprexiPraxis
//
//  Created by user245647 on 2/12/23.
//

import Foundation

// MARK: - Login
struct Login: Decodable {
    let success: Bool
    let idUser: Int
    let token: String
    
    static var example: Login {
        return Login(
            success: true,
            idUser: 4,
            token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo4MywidXNlcm5hbWUiOiJNYXJpbyIsImV4cCI6MTcwMTUzMjE3OSwia2lkIjoia2lkXzY1NmI0NDAzOGZmZmU5Ljg4ODIyMjU4In0.G_9Jz-rFB-aaLMnGPD4UMXnnk0WEMUA18MzKwmOuDGA"
        )
    }
}
