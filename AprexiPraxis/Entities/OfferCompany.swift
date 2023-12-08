//
//  OfferCompany.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//

import Foundation

struct ListOfferCompany: Decodable {
    let offer: [Offer]
    let success: Bool
    let idError: String?
    let messageError: String?
    
    static var example: ListOfferCompany {
        return ListOfferCompany(
            offer: [Offer.example],
            success: true,
            idError: nil,
            messageError: nil
        )
    }
}

// MARK: - Offer
struct Offer: Decodable {
    let idOffer, idCompany: Int
    let nameCompany, nameModality, datePublication, nameWorking: String
    let nameContract: String
    let numVacancies: Int
    let nameTypeStudies, nameStudies, nameSkills, minRequirements: String
    let jobDescription: String
    let numRegistered: Int
    let nameMunicipality: String
    let salary: Int
    let offerTitle: String
    let logoCompany: String
    let imageCompany: String?
    let combinedLanguages: String
    let combinedLicenses: String?
    let minExperience: Int?
    let followCompany, followOffer, requestOffer: Int
    
    static var example: Offer {
        return Offer(
            idOffer: 1,
            idCompany: 1,
            nameCompany: "Company Name",
            nameModality: "Modality",
            datePublication: "2023-11-21",
            nameWorking: "Working Name",
            nameContract: "Contract",
            numVacancies: 5,
            nameTypeStudies: "Type of Studies",
            nameStudies: "Studies",
            nameSkills: "Skills",
            minRequirements: "Requirements",
            jobDescription: "Job Description",
            numRegistered: 10,
            nameMunicipality: "Municipality",
            salary: 50000,
            offerTitle: "Offer Title",
            logoCompany: "Logo URL",
            imageCompany: "Image URL",
            combinedLanguages: "Languages",
            combinedLicenses: "Licenses",
            minExperience: 2,
            followCompany: 1,
            followOffer: 0,
            requestOffer: 0
        )
    }
}

