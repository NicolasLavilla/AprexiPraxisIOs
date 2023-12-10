//
//  Studies.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//


import Foundation

// MARK: - ListStudiesUser
struct ListStudiesUser: Decodable {
    let studiesUser: [StudiesUser]
    let success: Bool
    let idError: String?
    let messageError: String?
    
    static var example: ListStudiesUser {
        return ListStudiesUser(
            studiesUser: [StudiesUser.example],
            success: true,
            idError: nil,
            messageError: nil
        )
    }
}

// MARK: - StudiesUser
struct StudiesUser: Decodable, Identifiable {
    let idStudiesUser: Int
    let idNameStudies: Int
    let nameStudies: String
    let typeStudies: Int
    let nameTypeStudies: String
    let professionalFamilies: Int
    let nameFamily: String
    let idSchool: Int
    let nameSchool: String
    let startYear: String
    let endYear: String
    
    var id: Int {idStudiesUser}
    
    static var example: StudiesUser {
        return StudiesUser(
            idStudiesUser: 1,
            idNameStudies: 2,
            nameStudies: "Computer Science",
            typeStudies: 1,
            nameTypeStudies: "Bachelor's Degree",
            professionalFamilies: 3,
            nameFamily: "Technology",
            idSchool: 4,
            nameSchool: "University of Example",
            startYear: "2018",
            endYear: "2022"
        )
    }
}


