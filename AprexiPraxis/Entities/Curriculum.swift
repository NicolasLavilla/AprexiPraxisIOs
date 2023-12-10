//
//  Curriculum.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//

import Foundation

// MARK: - User
struct User: Decodable {
    let idUser: Int
    let name: String
    let surname1: String
    let surname2: String
    let idGender: Int
    let nameGender: String
    let mobile: Int
    let email: String
    let dni: String?
    let nie: String?
    let passport: String?
    let birthDate: String
    let address: String
    let idMunicipality: Int
    let codCountry: Int
    let nameCountry: String
    let codAuto: Int
    let nameCcaa: String
    let idProvince: Int
    let nameProvince: String
    let codMunicipality: Int
    let nameMunicipality: String
    let dateCreation: String
    let description: String
    let workPermit: Int
    let autonomousDischarge: Int
    let ownVehicle: Int
    let image: String
    let success: Bool
    let idError: String?
    let messageError: String?
    
    static var example: User {
        return User(
            idUser: 123,
            name: "John",
            surname1: "Doe",
            surname2: "Smith",
            idGender: 1,
            nameGender: "Male",
            mobile: 123456789,
            email: "john.doe@example.com",
            dni: "12345678A",
            nie: nil,
            passport: "AB123456",
            birthDate: "1990-01-01",
            address: "123 Main Street",
            idMunicipality: 456,
            codCountry: 789,
            nameCountry: "Country Name",
            codAuto: 987,
            nameCcaa: "CCAA Name",
            idProvince: 654,
            nameProvince: "Province Name",
            codMunicipality: 321,
            nameMunicipality: "Municipality Name",
            dateCreation: "2022-12-31",
            description: "Description of the user",
            workPermit: 1,
            autonomousDischarge: 0,
            ownVehicle: 1,
            image: "URL to user image",
            success: true,
            idError: nil,
            messageError: nil
        )
    }

}

