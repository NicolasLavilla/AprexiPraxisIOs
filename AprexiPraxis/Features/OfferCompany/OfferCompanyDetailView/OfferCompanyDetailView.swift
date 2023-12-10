//
//  OfferCompanyDetailView.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//
import SwiftUI

struct OfferCompanyDetailView: View {
    @EnvironmentObject var coordinator: Coordinator
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
        NavigationStack {
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
                            NavigationLink(
                                destination: coordinator.makeCompanyView(idUser: idUser, idCompany: offer.idCompany, token: token),
                                label: {
                                    Text(offer.nameCompany)
                                }
                            )
                            
                            
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
                            
                            Spacer()
                            Button(action: {
                                requestFunction()
                            }) {
                                Text("Inscribirse")
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(viewModel.isRequest ? Color.gray : Color.blue)
                                    .cornerRadius(8)
                            }
                            .disabled(viewModel.isRequest)
                            
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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Llama a tu función aquí
                        followFunction()
                    }) {
                        Image(systemName: viewModel.isFollowed ? "heart.fill" : "heart")
                    }
                }
            }
            .onAppear {

                getOfferCompany(idOffer: idOffer, idUser: idUser, token: token)
            }
        }
    }
    private func followFunction() {
        if viewModel.isFollowed {
            Task{
                await viewModel.setDeleteFollowOffer(idOffer: viewModel.offer!.idOffer, idUser: idUser, token: token)
            }
        } else {
            Task{
                await viewModel.setInsertFollowOffer(idOffer: viewModel.offer!.idOffer, idUser: idUser, token: token)
            }

        }
    }
    
    private func requestFunction() {
       
        if viewModel.isRequest {
            
        } else {
            Task{
                await viewModel.setInsertRequestOffer(idOffer: viewModel.offer!.idOffer, idUser: idUser, token: token)
            }

        }
    }

    
    private func getOfferCompany(idOffer: Int, idUser: Int, token: String){
        Task {
            await viewModel.getOfferCompany(idOffer: idOffer, idUser: idUser, token: token)
        }
    }
    
}

#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeOfferCompanyDetailView(idOffer: 4, idUser: 4, token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6Ik1hcmlhIiwiZXhwIjoxNzAyMzkxMzA2LCJraWQiOiJraWRfNjU3ODVmZmE2YTcyYTEuMDU3NzExMjcifQ.onWr-c7GoJJr6iJTnqWSJkakq_UYlJ4-7ABHZ5FJWPQ")
        .environmentObject(coordinator)
}

