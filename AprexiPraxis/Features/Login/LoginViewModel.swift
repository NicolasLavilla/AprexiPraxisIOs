//
//  LoginViewModel.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    private let loginRepository: LoginRepository
    
    @Published var isLoading = false
    @Published var login: Login?
    @Published var error: Error? = nil // Asignación de valor inicial
    
    init(loginRepository: LoginRepository) {
        self.loginRepository = loginRepository
    }
    
    @MainActor
    func getLogin(email: String, password: String) async {
        do {
            error = nil
            isLoading = true
            
            login = try await loginRepository.getLogin(email: email, password: password)
                
        } catch {
            self.error = error
        }
            isLoading = false
        
    }
}

