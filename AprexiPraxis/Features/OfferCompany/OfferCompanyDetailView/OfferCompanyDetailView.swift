//
//  OfferCompanyDetailView.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//
import SwiftUI

struct OfferCompanyDetailView: View {
    
    @StateObject private var viewModel: OfferCompanyDetailViewModel
     
     init(idOffer: Int, idUser: Int, token: String) {
         _viewModel = StateObject(wrappedValue: OfferCompanyDetailViewModel(offerCompanyRepository: OfferCompanyRepository(remoteService: LiveOfferCompanyRemoteService(networkClient: URLSessionNetworkClient()))))
         
         self.idOffer = idOffer
         self.idUser = idUser
         self.token = token
     }
     
     private let idOffer: Int
     private let idUser: Int
     private let token: String
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 20) {
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1.5)
                } else if let offer = viewModel.offer {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Offer Title:")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text(offer.offerTitle)
                        
                        Text("Company:")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text(offer.nameCompany)
                        
                        Text("Date of Publication:")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text(offer.datePublication)
                        
                        Text("Job Description:")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text(offer.jobDescription)
                        
                        Text("Salary:")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text("\(offer.salary)")
                        
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

        .navigationTitle(viewModel.offer?.offerTitle ?? "Offer Detail")
                .onAppear {
                    Task {
                        await viewModel.getOfferCompany(idOffer: idOffer, idUser: idUser, token: token)
                    }
                }
    }
    
    func getTypeImage(offer: Offer) -> String {
        // Reemplazar con la lógica correspondiente según offer
        return "car" // Valor predeterminado
    }
}

// Reemplaza los valores con tus datos reales
#Preview {
    OfferCompanyDetailView(idOffer: 4, idUser: 4, token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo4MywidXNlcm5hbWUiOiJNYXJpbyIsImV4cCI6MTcwMTUyMjI2NSwia2lkIjoia2lkXzY1NmIxZDQ5ZDhlYTAwLjM2NTc5NDAxIn0.c9ZwC_PK98Z-P_22h7veWX4EqR823cOW2LpYfXv2KPU")
}
