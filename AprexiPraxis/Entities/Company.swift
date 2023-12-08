//
//  Company.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//

import Foundation

// MARK: - Company
struct Company: Decodable {
    let idCompany: Int
    let dateCompanyCreation: String
    let dateCompanyFundation: String
    let nameCompany: String
    let nif: String
    let address: String
    let nameMunicipality: String
    let phone: Int
    let email: String
    let websites: String
    let description: String
    let numWorkers: Int
    let nameTypeCompany: String
    let nameSectorBusiness: String
    let logoCompany: String
    let imageCompany: String
    let followCompany: Int
    let success: Bool
    let idError: Int?
    let messageError: String?

    static var example: Company {
        return Company(
            idCompany: 1,
            dateCompanyCreation: "2023-11-21",
            dateCompanyFundation: "2020-01-01",
            nameCompany: "Company Name",
            nif: "Company NIF",
            address: "Company Address",
            nameMunicipality: "Municipality",
            phone: 123456789,
            email: "company@email.com",
            websites: "www.company.com",
            description: "Company Description",
            numWorkers: 100,
            nameTypeCompany: "Type of Company",
            nameSectorBusiness: "Business Sector",
            logoCompany: "Logo URL",
            imageCompany: "Image URL",
            followCompany: 1,
            success: true,
            idError: nil,
            messageError: nil
        )
    }
}
