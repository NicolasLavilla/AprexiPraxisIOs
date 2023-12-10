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
    private let curriculumRepository: CurriculumRepository
    private let studiesRepository: StudiesRepository
    private let experienceRepository: ExperienceRepository
    private let languagesRespository: LanguagesRepository
    private let licenseRepository: LicenseRepository
    private let professionalProyectsRepository: ProfessionalProyectsRepository
    
    
    init(mock: Bool = false) {
        let networkClient = URLSessionNetworkClient()
        
        // MARK: OfferCompany - FollowOffer - RequestOffer
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
        
        // MARK: Curriculum
        let curriculumRemoteService: CurriculumRemoteService = mock ? MockCurriculumRemoteService() : LiveCurriculumRemoteService(networkClient: networkClient)
        
        self.curriculumRepository = CurriculumRepository(remoteService: curriculumRemoteService)
        
        // MARK: Studies
        let studiesRemoteService: StudiesRemoteService = mock ? MockStudiesRemoteService() : LiveStudiesRemoteService(networkClient: networkClient)
       
        self.studiesRepository = StudiesRepository(remoteService: studiesRemoteService)
       
        // MARK: Experience
        let experienceRemoteService: ExperienceRemoteService = mock ? MockExperienceRemoteService() : LiveExperienceRemoteService(networkClient: networkClient)
       
        self.experienceRepository = ExperienceRepository(remoteService: experienceRemoteService)
        
        // MARK: Languages
        let languagesRemoteService: LanguagesRemoteService = mock ? MockLanguagesRemoteService() : LiveLanguagesRemoteService(networkClient: networkClient)
        
        self.languagesRespository = LanguagesRepository(remoteService: languagesRemoteService)
 
        // MARK: License
        let licenseRemoteService: LicenseRemoteService = mock ? MockLicenseRemoteService() : LiveLicenseRemoteService(networkClient: networkClient)
        
        self.licenseRepository = LicenseRepository(remoteService: licenseRemoteService)
        
        // MARK: ProfessionalProyects
        let professionalProyectsRemoteService: ProfessionalProyectsRemoteService = mock ? MockProfessionalProyectsRemoteService() : LiveProfessionalProyectsRemoteService(networkClient: networkClient)
        
        self.professionalProyectsRepository = ProfessionalProyectsRepository(remoteService: professionalProyectsRemoteService)
    }
    
    
    // MARK: Curriculum views
    func makeCurriculumView(idUser: Int, token: String) -> CurriculumView {
        return CurriculumView(idUser: idUser, token: token)
    }
    
    // MARK: OfferCompany views
    func makeOfferCompanyMainView(idUser: Int, token: String) -> OfferCompanyMainView {
        return OfferCompanyMainView(idUser: idUser, token: token)
    }
    
    func makeFollowOfferMainView(idUser: Int, token: String) -> FollowOfferView {
        return FollowOfferView(idUser: idUser, token: token)
    }
    
    func makeRequestOfferMainView(idUser: Int, token: String) -> RequestOfferView {
        return RequestOfferView(idUser: idUser, token: token)
    }

    func makeOfferCompanyDetailView(idOffer: Int, idUser: Int, token: String) -> OfferCompanyDetailView {
        return OfferCompanyDetailView(idOffer: idOffer, idUser: idUser, token: token)
    }
    
    func makeRequestOfferDetailView(idUser: Int, idOffer: Int, token: String) -> RequestOfferDetailView {
        return RequestOfferDetailView(idUser: idUser, idOffer: idOffer, token: token)
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
    func makeCompanyView(idUser: Int, idCompany: Int, token: String) -> CompanyView {
        return CompanyView(idUser: idUser, idCompany: idCompany, token: token)
    }
    
    // MARK: Viewmodels
    private func makeOfferCompanyViewModel() -> OfferCompanyViewModel {
        return OfferCompanyViewModel(offerCompanyRepository: offerCompanyRepository)
    }
    
    private func makeFollowOfferViewModel() -> FollowOfferViewModel {
        return FollowOfferViewModel(offerCompanyRepository: offerCompanyRepository)
    }
    
    private func makeRequestOfferViewModel() -> RequestOfferViewModel {
        return RequestOfferViewModel(offerCompanyRepository: offerCompanyRepository)
    }
    
    private func makeOfferCompanyDetailViewModel() -> OfferCompanyDetailViewModel {
        return OfferCompanyDetailViewModel(offerCompanyRepository: offerCompanyRepository)
    }
    
    private func makeRequestOfferDetailViewModel() -> RequestOfferDetailViewModel {
        return RequestOfferDetailViewModel(offerCompanyRepository: offerCompanyRepository)
    }
    
    private func makeLoginViewModel() -> LoginViewModel {
        return LoginViewModel(loginRepository: loginRepository)
    }
    
    private func makeCompanyViewModel() -> CompanyViewModel {
        return CompanyViewModel(companyRepository: companyRepository)
    }
    
    private func makeCurriculumViewModel() -> CurriculumViewModel {
        return CurriculumViewModel(curriculumRepository: curriculumRepository,studiesRepository: studiesRepository,experienceRepository: experienceRepository,
                                   languagesRepository: languagesRespository,licenseRepository: licenseRepository,professionalProyectsRepository: professionalProyectsRepository)
    }
}
