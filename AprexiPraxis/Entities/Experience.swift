//
//  Experience.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//

import Foundation

// MARK: - ListExperienceJobUser
struct ListExperienceJobUser: Decodable {
    let experienceJobUser: [ExperienceJobUser]
    let success: Bool
    let idError: String?
    let messageError: String?
    
    static var example: ListExperienceJobUser {
        return ListExperienceJobUser(
            experienceJobUser: [ExperienceJobUser.example],
            success: true,
            idError: nil,
            messageError: nil
        )
    }
}

// MARK: - ExperienceJobUser
struct ExperienceJobUser: Decodable, Identifiable {
    let idExperienceJobUser: Int
    let nameJobs: String
    let level: Int
    let nameLevelJob: String
    let idCategory: Int
    let nameCategory: String
    let descriptionJob: String
    let idCompany: Int
    let nameCompany: String
    let initDate: String
    let endDate: String?
    
    var id: Int {idExperienceJobUser}
    
    static var example: ExperienceJobUser {
        return ExperienceJobUser(
            idExperienceJobUser: 1,
            nameJobs: "Software Developer",
            level: 2,
            nameLevelJob: "Senior",
            idCategory: 3,
            nameCategory: "Technology",
            descriptionJob: "Developed web applications using modern technologies.",
            idCompany: 4,
            nameCompany: "Tech Company",
            initDate: "2018-01-01",
            endDate: "2022-12-31"
        )
    }
}
