//
//  ProfessionalProyects.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//

import Foundation

// MARK: - ListProfessionalProyectsUser
struct ListProfessionalProyectsUser: Decodable {
    let professionalProyectsUser: [ProfessionalProyectsUser]
    let success: Bool
    let idError: String?
    let messageError: String?
    
    static var example: ListProfessionalProyectsUser {
        return ListProfessionalProyectsUser(
            professionalProyectsUser: [ProfessionalProyectsUser.example],
            success: true,
            idError: nil,
            messageError: nil
        )
    }
}

// MARK: - ProfessionalProyectsUser
struct ProfessionalProyectsUser: Decodable, Identifiable {
    let idProfessionalProyects: Int
    let nameProyect: String
    let descriptionProyect: String
    let websites: String?
    let imageProyect: String?
    let job: String?
    let briefcase: String?
    let initDate: String?
    let endDate: String?
    
    var id: Int {idProfessionalProyects}
    
    static var example: ProfessionalProyectsUser {
        return ProfessionalProyectsUser(
            idProfessionalProyects: 1,
            nameProyect: "Project Name",
            descriptionProyect: "Project Description",
            websites: "https://example.com",
            imageProyect: "https://example.com/image.jpg",
            job: "Job Title",
            briefcase: "Briefcase",
            initDate: "2023-01-01",
            endDate: "2023-12-31"
        )
    }
}
