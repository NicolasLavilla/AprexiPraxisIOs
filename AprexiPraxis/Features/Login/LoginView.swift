//
//  LoginView.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel(loginRepository: LoginRepository(remoteService: LiveLoginRemoteService(networkClient: URLSessionNetworkClient())))
    
    @State private var email = ""
    @State private var password = ""
    @State private var showErrorAlert = false
    @State private var isLoggedIn = false // Controla la navegación a ContentView
    
    var body: some View {
        NavigationView {
            VStack {
                // Email y contraseña TextField
                
                VStack(alignment: .leading) {
                    Text("Email")
                        .font(.headline)
                    TextField("Ingrese su email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textCase(.lowercase) // Convierte el texto a minúsculas

                }
                .padding(.horizontal)
                
                VStack(alignment: .leading) {
                    Text("Contraseña")
                        .font(.headline)
                    SecureField("Ingrese su contraseña", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding(.horizontal)
                
                Button(action: {
                    Task {
                        await viewModel.getLogin(email: email, password: password)
                        if viewModel.login?.success == true {
                            isLoggedIn = true // Actualiza el estado para navegar a ContentView
                        } else {
                            showErrorAlert = true
                        }
                    }
                }) {
                    Text("Iniciar Sesión")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()
                .alert(isPresented: $showErrorAlert) {
                    Alert(title: Text("Error"), message: Text("No ha funcionado"), dismissButton: .default(Text("OK")))
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Inicio de Sesión")
        }
        .background(
            NavigationLink(
                destination: ContentView(idUser: viewModel.login?.idUser ?? 0, token: viewModel.login?.token ?? ""),
                isActive: $isLoggedIn,
                label: { EmptyView() }
            )
            .opacity(0)
        )
    }
}


#Preview {
    LoginView()
}
