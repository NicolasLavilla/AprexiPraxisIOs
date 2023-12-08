//
//  CompanyRempteService.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//


import Foundation

protocol CompanyRemoteService {
    func getCompany() async throws -> [Company]
}
