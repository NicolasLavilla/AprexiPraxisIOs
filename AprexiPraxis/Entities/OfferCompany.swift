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

struct ListFollowOffer: Decodable {
    let offer: [Offer]
    let success: Bool
    let idError: String?
    let messageError: String?
    
    static var example: ListFollowOffer {
        return ListFollowOffer(
            offer: [Offer.example],
            success: true,
            idError: nil,
            messageError: nil
        )
    }
}


// MARK: - Offer
struct Offer: Decodable,Identifiable {
    let idOffer: Int
    let idCompany: Int
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
    
    var id: Int{idOffer}
    
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



struct ListRequestOffer: Decodable {
    let requestOffer: [RequestOffer]
    let success: Bool
    let idError: String?
    let messageError: String?
    
    static var example: ListRequestOffer {
        return ListRequestOffer(
            requestOffer: [RequestOffer.example],
            success: true,
            idError: nil,
            messageError: nil
        )
    }
}


// MARK: - RequestOffer
struct RequestOffer: Decodable, Identifiable{
    let idOffer, idCompany: Int
    let nameCompany, datePublication, offerTitle: String
    let idRequestOffer: Int
    let dateRequest: String
    let stateRequest: Int
    let nameState: String
    let numRegistered: Int
    let logoCompany: String
    
    var id: Int{idOffer}
    
    static var example: RequestOffer {
        return RequestOffer(
            idOffer: 1,
            idCompany: 1,
            nameCompany: "Company Name",
            datePublication: "2023-11-21",
            offerTitle: "Arquitecto",
            idRequestOffer: 1,
            dateRequest: "2023-11-21",
            stateRequest: 1,
            nameState: "Inscrito",
            numRegistered: 1,
            logoCompany: "Skills"
        )
    }
}


// MARK: - ListDetailRequestOffer
struct ListDetailRequestOffer: Decodable {
    let detailRequestOffer: [DetailRequestOffer]
    let success: Bool
    let idError: String?
    let messageError: String?
    
    static var example: ListDetailRequestOffer {
        return ListDetailRequestOffer(
            detailRequestOffer: [DetailRequestOffer.example],
            success: true,
            idError: nil,
            messageError: nil
        )
    }
}


// MARK: - DetailRequestOffer
struct DetailRequestOffer: Decodable, Identifiable {
    let dateRequest: String
    let stateRequest: Int
    let nameState, descriptionActionRequest: String

    //var id = UUID()
    
    var id: String{dateRequest}
    
    static var example: DetailRequestOffer {
        return DetailRequestOffer(
            dateRequest: "2023-10-26 13:41:13",
            stateRequest: 1,
            nameState: "CV LEIDO",
            descriptionActionRequest: "La empresa ha leído tu CV"
        )
    }
}

// MARK: - InsertFollowOfferUser
struct InsertFollowOfferUser: Decodable {
    let success: Bool
    let idError: String?
    let messageError: String?
    
    static var example: InsertFollowOfferUser {
        return InsertFollowOfferUser(
            success: true,
            idError: nil,
            messageError: nil
        )
    }
}

// MARK: - DeleteFollowOfferUser
struct DeleteFollowOfferUser: Decodable {
    let success: Bool
    let idError: String?
    let messageError: String?
    
    static var example: DeleteFollowOfferUser {
        return DeleteFollowOfferUser(
            success: true,
            idError: nil,
            messageError: nil
        )
    }
}

// MARK: - InsertRequestOfferUser
struct InsertRequestOfferUser: Decodable {
    let success: Bool
    let idError: String?
    let messageError: String?
    
    static var example: InsertRequestOfferUser {
        return InsertRequestOfferUser(
            success: true,
            idError: nil,
            messageError: nil
        )
    }
}

