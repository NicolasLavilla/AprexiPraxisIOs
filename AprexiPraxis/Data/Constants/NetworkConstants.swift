//
//  NetworkConstants.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//

import Foundation

struct NetworkConstants {
    static let baseURL = "https://praxisal.aprexi.com/"
    static let loginNetworkUrl = baseURL + "LoginUser.php?"
    static let companyNetworkUrl = baseURL + "Company.php?"
    static let listOfferCompanyNetworkUrl = baseURL + "ListOfferCompany.php?"
    static let getOfferCompanyNetworkUrl = baseURL + "OfferCompany.php?"
    static let listFollowOfferNetworkUrl = baseURL + "ListFollowOffer.php?"
    static let listRequestOfferNetworkUrl = baseURL + "ListRequestOffer.php?"
    static let listDetailRequestOfferNetworkUrl = baseURL + "ListDetailRequestOffer.php?"
    static let followOfferUser = baseURL + "FollowOfferUser.php?"
    static let deleteFollowOfferUser = baseURL + "DeleteFollowOfferUser.php?"
    static let requestOfferUser = baseURL + "RequestOfferUser.php?"
    
    //CV User
    static let user = baseURL + "User.php?"
    static let listStudiesUser = baseURL + "ListStudiesUser.php?"
    static let listExperienceJobUser = baseURL + "ListExperienceJobUser.php?"
    static let listLanguagesUser = baseURL + "ListLanguagesUser.php?"
    static let listLicenseUser = baseURL + "ListLicenseUser.php?"
    static let listProfessionalProyectsUser = baseURL + "ListProfessionalProyectsUser.php?"
    
    
}

