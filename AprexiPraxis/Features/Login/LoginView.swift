//
//  LoginView.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//

import SwiftUI
import CryptoKit

struct LoginView: View {
    
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var viewModel = LoginViewModel(loginRepository: LoginRepository(remoteService: LiveLoginRemoteService(networkClient: URLSessionNetworkClient())))
    
    @State private var email = ""
    @State private var password = ""
    @State private var showErrorAlert = false
    @State private var isLoggedIn = false
    @State private var idUser: Int = 0
    @State private var token: String = ""
     
    var body: some View {
        if isLoggedIn{
            ContentView(idUser: idUser, token: token)
        }else{
            NavigationView {
                VStack {
                    
                    VStack(alignment: .leading) {
                        Text("Email")
                            .font(.headline)
                        TextField("Ingrese su email", text: $email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .textCase(.lowercase)
                        
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading) {
                        Text("Contraseña")
                            .font(.headline)
                        SecureField("Ingrese su contraseña", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    .padding(.horizontal)
                    
                    Button(action: { Task { await loginFunc() } }) {
                        Text("Iniciar Sesión")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    .padding()
                    .alert(isPresented: Binding<Bool>(
                        get: { self.showErrorAlert },
                        set: { _ in self.showErrorAlert = false }
                    )) {
                        Alert(title: Text("Error"), message: Text("El inicio de sesión falló"), dismissButton: .default(Text("OK")))
                    }
                    Spacer()
                }
                .padding()
                .navigationTitle("Inicio de Sesión")
               
            }
        }
    }
    
    private func loginFunc() async {
        let hashedPassword = hashPassword(password: password)

        do {
            if let login = try await viewModel.getLogin(email: email, password: hashedPassword) {
                if login.success {
                    idUser = login.idUser
                    token = login.token
                    isLoggedIn = true
                } else {
                    isLoggedIn = false
                    showErrorAlert = true
                }
            } else {
                showErrorAlert = true
            }
        } catch {
            print("Error: \(error)")
            showErrorAlert = true
        }
    }

    private func hashPassword(password: String) -> String {
        if let data = password.data(using: .utf8) {
            let hashed = SHA256.hash(data: data)
            let hashString = hashed.compactMap { String(format: "%02x", $0) }.joined()
            return hashString
        }
        return ""
    }
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return LoginView().environmentObject(coordinator)
}
