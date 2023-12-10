//
//  CurriculumView.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//

import SwiftUI

struct CurriculumView: View {
    @StateObject private var viewModel: CurriculumViewModel
    @EnvironmentObject var coordinator: Coordinator

    init(idUser: Int, token: String) {
        let curriculumRepository = CurriculumRepository(remoteService: LiveCurriculumRemoteService(networkClient: URLSessionNetworkClient()))
        let studiesRepository = StudiesRepository(remoteService: LiveStudiesRemoteService(networkClient: URLSessionNetworkClient()))
        let experienceRepository = ExperienceRepository(remoteService: LiveExperienceRemoteService(networkClient: URLSessionNetworkClient()))
        let languagesRepository = LanguagesRepository(remoteService: LiveLanguagesRemoteService(networkClient: URLSessionNetworkClient()))
        let licenseRepository = LicenseRepository(remoteService: LiveLicenseRemoteService(networkClient: URLSessionNetworkClient()))
        let professionalProyectsRepository = ProfessionalProyectsRepository(remoteService: LiveProfessionalProyectsRemoteService(networkClient: URLSessionNetworkClient()))

        _viewModel = StateObject(wrappedValue: CurriculumViewModel(
            curriculumRepository: curriculumRepository,
            studiesRepository: studiesRepository,
            experienceRepository: experienceRepository,
            languagesRepository: languagesRepository,
            licenseRepository: licenseRepository,
            professionalProyectsRepository: professionalProyectsRepository
        ))
        
        self.idUser = idUser
        self.token = token
    }

    private let idUser: Int
    private let token: String
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    if viewModel.isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .scaleEffect(1.5)
                    } else if let user = viewModel.user {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Offer Title:")
                                .font(.headline)
                                .fontWeight(.bold)
                            Text(user.name)
                            
                            Text("Date of Publication:")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                Text(user.surname1)
                                
                                Text("Job Description:")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                Text(user.surname2)
                                
                                Text("Salary:")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                Text("\(user.email)")
                        }
                        .padding()
                    } else if let error = viewModel.error {
                        Text("Error: \(error.localizedDescription)")
                            .foregroundColor(.red)
                    }
                    
                    // Show studies if available
                    if let studies = viewModel.listStudiesUser?.studiesUser, !studies.isEmpty {
                        Section(header: Text("Studies").font(.title3)
                            .fontWeight(.bold)) {
                            ForEach(studies) { studiesUser in
                                StudiesRowView(studiesUser: studiesUser)
                            }
                        }
                    } else {
                        Text("No hay estudios disponibles")
                            .foregroundColor(.gray)
                    }

                    // Show experience if available
                    if let experiences = viewModel.listExperienceJobUser?.experienceJobUser, !experiences.isEmpty {
                        Section(header: Text("Experiences").font(.title3)
                            .fontWeight(.bold)) {
                            ForEach(experiences) { experienceJobUser in
                                ExperienceRowView(experienceJobUser: experienceJobUser)
                            }
                        }
                    } else {
                        Text("No hay experiencias disponibles")
                            .foregroundColor(.gray)
                    }

                    // Show languages if available
                    if let languages = viewModel.listLanguagesUser?.languagesUser, !languages.isEmpty {
                        Section(header: Text("Languages").font(.title3)
                            .fontWeight(.bold)) {
                            ForEach(languages) { language in
                                LanguagesRowView(languagesUser: language)
                            }
                        }
                    } else {
                        Text("No hay idiomas disponibles")
                            .foregroundColor(.gray)
                    }

                    // Show license if available
                    if let license = viewModel.listLicenseUser?.licenseUser, !license.isEmpty {
                        Section(header: Text("Licenses").font(.title3)
                            .fontWeight(.bold)) {
                            ForEach(license) { license in
                                LicenseRowView(licenseUser: license)
                            }
                        }
                    } else {
                        Text("No hay licencias disponibles")
                            .foregroundColor(.gray)
                    }

                    // Show professional projects if available
                    if let professionalProyects = viewModel.listProfessionalProyectsUser?.professionalProyectsUser, !professionalProyects.isEmpty {
                        Section(header: Text("Professional Projects").font(.title3)
                            .fontWeight(.bold)) {
                            ForEach(professionalProyects) { professionalProyects in
                                ProfessionalProyectsRowView(professionalProyectsUser: professionalProyects)
                            }
                        }
                    } else {
                        Text("No hay proyectos profesionales disponibles")
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Curriculum")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    // Your toolbar item code...
                }
            }
            .onAppear {
                    getUser( idUser: idUser, token: token)
                    getListStudiesUser( idUser: idUser, token: token)
                    getListExperienceJobUser( idUser: idUser, token: token)
                    getListLanguagesUser( idUser: idUser, token: token)
                    getListLicenseUser( idUser: idUser, token: token)
                    getListProfessionalProyectsUser( idUser: idUser, token: token)
            }
        }
    }



    
    private func getUser(idUser: Int, token: String){
        Task {
            await viewModel.getUser(idUser: idUser, token: token)
        }
    }
    
    private func getListStudiesUser(idUser: Int, token: String){
        Task {
            await viewModel.getListStudiesUser(idUser: idUser, token: token)
        }
    }
    
    private func getListExperienceJobUser(idUser: Int, token: String){
        Task {
            await viewModel.getListExperienceJobUser(idUser: idUser, token: token)
        }
    }
    
    private func getListLanguagesUser(idUser: Int, token: String){
        Task {
            await viewModel.getListLanguagesUser(idUser: idUser, token: token)
        }
    }
    
    private func getListLicenseUser(idUser: Int, token: String){
        Task {
            await viewModel.getListLicenseUser(idUser: idUser, token: token)
        }
    }
    
    private func getListProfessionalProyectsUser(idUser: Int, token: String){
        Task {
            await viewModel.getListProfessionalProyectsUser(idUser: idUser, token: token)
        }
    }
}


#Preview {
    let coordinator = Coordinator(mock: true)
    return coordinator.makeCurriculumView( idUser: 4, token: "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0LCJ1c2VybmFtZSI6Ik1hcmlhIiwiZXhwIjoxNzAyMzg1NDYzLCJraWQiOiJraWRfNjU3ODQ5Mjc1NzcxYjAuMDA1NDIwNjkifQ._IhI04w17dXKtO3jzQwLXj7msRQry48hX2HwVHs0m0I")
        .environmentObject(coordinator)
}
