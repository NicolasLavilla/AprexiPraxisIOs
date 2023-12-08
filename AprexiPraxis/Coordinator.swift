//
//  Coordinator.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//

import Foundation

class Coordinator: ObservableObject {
    private let offerCompanyRepository: OfferCompanyRepository
    private let tokenRepository: TokenRepository
    private let companyRepository: CompanyRepository
    private let loginRepository: LoginRepository
    
    
    init(mock: Bool = false) {
        let networkClient = URLSessionNetworkClient()
        
        // MARK: OfferCompany
        let offerCompanyRemoteService: OfferCompanyRemoteService = mock ? MockOfferCompanyRemoteService() : LiveOfferCompanyRemoteService(networkClient: networkClient)
        
        self.offerCompanyRepository = OfferCompanyRepository(remoteService: offerCompanyRemoteService)
        
        // MARK: Token
        let tokenRemoteService: TokenRemoteService = mock ? MockTokenRemoteService() : LiveTokenRemoteService(networkClient: networkClient)
        
        self.tokenRepository = TokenRepository(remoteService: tokenRemoteService)
        
        // MARK: Company
        let companyRemoteService: CompanyRemoteService = mock ? MockCompanyRemoteService() : LiveCompanyRemoteService(networkClient: networkClient)
        
        self.companyRepository = CompanyRepository(remoteService: companyRemoteService)
        
        // MARK: Login
        let loginRemoteService: LoginRemoteService = mock ? MockLoginRemoteService() : LiveLoginRemoteService(networkClient: networkClient)
        
        self.loginRepository = LoginRepository(remoteService: loginRemoteService)
    }
    
    // MARK: OfferCompany views
    func makeOfferCompanyMainView(idUser: Int, token: String) -> OfferCompanyMainView {
        return OfferCompanyMainView(idUser: idUser, token: token)
    }

    
    func makeOfferCompanyDetailView(idOffer: Int, idUser: Int, token: String) -> OfferCompanyDetailView {
        return OfferCompanyDetailView(idOffer: idOffer, idUser: idUser, token: token)
    }
    
    // MARK: Login views
    func makeLoginView(email: String, password: String) -> LoginView {
        return LoginView()
    }
    
    // MARK: Token views
  /*  func makeVehiclesMainView() -> VehiclesMainView {
        return VehiclesMainView()
    }*/
    
    
    // MARK: Company view
   /* func makeCharactersView() -> CharactersView {
        return CharactersView(viewModel: makeCharactersViewModel())
    }*/
    
   
    
    // MARK: Viewmodels
    private func makeOfferCompanyViewModel() -> OfferCompanyViewModel {
        return OfferCompanyViewModel(offerCompanyRepository: offerCompanyRepository)
    }
    
    private func makeOfferCompanyDetailViewModel() -> OfferCompanyDetailViewModel {
        return OfferCompanyDetailViewModel(offerCompanyRepository: offerCompanyRepository)
    }
    
    private func makeLoginViewModel() -> LoginViewModel {
        return LoginViewModel(loginRepository: loginRepository)
    }
    
   
}
