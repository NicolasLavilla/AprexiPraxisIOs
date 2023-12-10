//
//  License.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//

import Foundation

// MARK: - ListLicenseUser
struct ListLicenseUser: Decodable {
    let licenseUser: [LicenseUser]
    let success: Bool
    let idError: String?
    let messageError: String?
    
    static var example: ListLicenseUser {
        return ListLicenseUser(
            licenseUser: [LicenseUser.example],
            success: true,
            idError: nil,
            messageError: nil
        )
    }
}

// MARK: - LicenseUser
struct LicenseUser: Decodable, Identifiable {
    let idLicenseUser: Int
    let idLicense: Int
    let nameLicense: String
    
    var id: Int {idLicenseUser}
    
    static var example: LicenseUser {
        return LicenseUser(
            idLicenseUser: 1,
            idLicense: 2,
            nameLicense: "B"
        )
    }
}

