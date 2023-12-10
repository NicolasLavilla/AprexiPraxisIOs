//
//  CompanyViewModel.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//

import Foundation

class CompanyViewModel: ObservableObject {
    
    private let companyRepository: CompanyRepository
    
    @Published var isLoading = false
    @Published var company: Company?
    @Published var error: Error?
    
    init(companyRepository: CompanyRepository) {
        self.companyRepository = companyRepository
    }
    
    @MainActor
    func getCompany(idUser: Int, idCompany: Int, token: String) async {
        error = nil
        isLoading = true
        
        do {
            company = try await companyRepository.getCompany(idUser: idUser, idCompany: idCompany, token: token)
        } catch {
            print("Error:", error)
            print("Company:", company)
            self.error = error
        }

        
        isLoading = false
    }
}
