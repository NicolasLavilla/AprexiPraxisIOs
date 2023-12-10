//
//  Languages.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//

import Foundation

// MARK: - ListLanguagesUser
struct ListLanguagesUser: Decodable {
    let languagesUser: [LanguagesUser]
    let success: Bool
    let idError: String?
    let messageError: String?
    
    static var example: ListLanguagesUser {
        return ListLanguagesUser(
            languagesUser: [LanguagesUser.example],
            success: true,
            idError: nil,
            messageError: nil
        )
    }
}

// MARK: - LanguagesUser
struct LanguagesUser: Decodable, Identifiable {
    let idLanguagesUser: Int
    let idLanguages: Int
    let nameLanguages: String
    let idExperience: Int
    let nameExperience: String
    
    var id: Int {idLanguagesUser}
    
    static var example: LanguagesUser {
        return LanguagesUser(
            idLanguagesUser: 1,
            idLanguages: 2,
            nameLanguages: "Spanish",
            idExperience: 3,
            nameExperience: "Advanced"
        )
    }
}
