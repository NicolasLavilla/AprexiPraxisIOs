//
//  CompanyView.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//

import SwiftUI

struct CompanyView: View {
    @EnvironmentObject var coordinator: Coordinator
    @StateObject private var viewModel: CompanyViewModel
     
    init(idUser: Int, idCompany: Int, token: String) {
        _viewModel = StateObject(wrappedValue: CompanyViewModel(companyRepository: CompanyRepository(remoteService: LiveCompanyRemoteService(networkClient: URLSessionNetworkClient()))))
         
         self.idUser = idUser
         self.idCompany = idCompany
         self.token = token
     }
    
     private let idUser: Int
     private let idCompany: Int
     private let token: String
    
    var body: some View {
    
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 20) {
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1.5)
                } else if let company: Company = viewModel.company {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Offer Title:")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text(company.nameCompany)
                        
                        Text("Company:")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text(company.address)
                        
                        Text("Date of Publication:")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text(company.email)
                        
                        Text("Job Description:")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text(company.dateCompanyCreation)
                        
                        // Añade más detalles aquí según sea necesario
                        
                    }
                    .padding()
                } else if let error = viewModel.error {
                    Text("Error: \(error.localizedDescription)")
                        .foregroundColor(.red)
                }
            }
            .padding(.horizontal)
        }

        .navigationTitle(viewModel.company?.nameCompany ?? "Offer Detail")
                .onAppear {
                    Task {
                        await viewModel.getCompany(idUser: idUser, idCompany: idCompany, token: token)
                }
            }
        }
    }

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeCompanyView(idUser: 83, idCompany: 1, token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6Ik1hcmlhIiwiZXhwIjoxNzAyMjkyNzM4LCJraWQiOiJraWRfNjU3NmRlZjI0Njc5MDQuMTczMjI0OTAifQ.H7y4Bo2ksw-sDTEkNTfsY-E2FhrOUBWCtwRTUT2dy8E")
        .environmentObject(coordinator)
}
