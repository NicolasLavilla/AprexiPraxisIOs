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
    @Published var error: Error?
    
    init(loginRepository: LoginRepository) {
        self.loginRepository = loginRepository
    }
    
    @MainActor
    func getLogin(email: String, password: String) async throws -> Login? {
        do {
            error = nil
            isLoading = true
            
            let loginResult = try await loginRepository.getLogin(email: email, password: password)
            
            print(loginResult)
            return Login(success: loginResult.success, idUser: loginResult.idUser, token: loginResult.token)
               
        } catch {
            print("Error:", error)
            self.error = error
            return nil // Añade un valor de retorno en caso de error
        }
    }

}
