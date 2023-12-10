//
//  CurriculumViewModel.swift
//  AprexiPraxis
//
//  Created by user245647 on 11/12/23.
//

import Foundation

class CurriculumViewModel: ObservableObject {
    private let curriculumRepository: CurriculumRepository
    private let studiesRepository: StudiesRepository
    private let experienceRepository: ExperienceRepository
    private let languagesRepository: LanguagesRepository
    private let professionalProyectsRepository: ProfessionalProyectsRepository
    private let licenseRepository: LicenseRepository
    
    @Published var isLoading = false
    @Published var user: User?
    @Published var listStudiesUser: ListStudiesUser?
    @Published var listExperienceJobUser: ListExperienceJobUser?
    @Published var listLanguagesUser: ListLanguagesUser?
    @Published var listLicenseUser: ListLicenseUser?
    @Published var listProfessionalProyectsUser: ListProfessionalProyectsUser?
    @Published var error: Error?
    
    init(curriculumRepository: CurriculumRepository, studiesRepository: StudiesRepository, experienceRepository: ExperienceRepository, languagesRepository: LanguagesRepository, licenseRepository: LicenseRepository, professionalProyectsRepository: ProfessionalProyectsRepository) {
        self.curriculumRepository = curriculumRepository
        self.studiesRepository = studiesRepository
        self.experienceRepository = experienceRepository
        self.languagesRepository = languagesRepository
        self.licenseRepository = licenseRepository
        self.professionalProyectsRepository = professionalProyectsRepository
    }
    
    @MainActor
    func getUser(idUser: Int, token: String) async {
        do {
            error = nil
            isLoading = true
            
            user = try await curriculumRepository.getUser(idUser: idUser, token: token)
                
        } catch {
            print("Error:", error)
            self.error = error
        }
            isLoading = false
        
    }
    
    @MainActor
    func getListLanguagesUser(idUser: Int, token: String) async {
        do {
            error = nil
            isLoading = true
            
            listLanguagesUser = try await languagesRepository.getListLanguagesUser(idUser: idUser, token: token)
                
        } catch {
            print("Error:", error)
            self.error = error
        }
            isLoading = false
        
    }
    
    @MainActor
    func getListProfessionalProyectsUser(idUser: Int, token: String) async {
        do {
            error = nil
            isLoading = true
            
            listProfessionalProyectsUser = try await professionalProyectsRepository.getListProfessionalProyectsUser(idUser: idUser, token: token)
                
        } catch {
            print("Error:", error)
            self.error = error
        }
            isLoading = false
        
    }
    
    @MainActor
    func getListLicenseUser(idUser: Int, token: String) async {
        do {
            error = nil
            isLoading = true
            
            listLicenseUser = try await licenseRepository.getListLicenseUser(idUser: idUser, token: token)
                
        } catch {
            print("Error:", error)
            self.error = error
        }
            isLoading = false
        
    }
    
    @MainActor
    func getListStudiesUser(idUser: Int, token: String) async {
        do {
            error = nil
            isLoading = true
            
            listStudiesUser = try await studiesRepository.getListStudiesUser(idUser: idUser, token: token)
            print(listStudiesUser)
                
        } catch {
            print("Error:", error)
            self.error = error
        }
            isLoading = false
        
    }
    
    @MainActor
    func getListExperienceJobUser(idUser: Int, token: String) async {
        do {
            error = nil
            isLoading = true
            
            listExperienceJobUser = try await experienceRepository.getListExperienceJobUser(idUser: idUser, token: token)
                
        } catch {
            print("Error:", error)
            self.error = error
        }
            isLoading = false
        
    }
}
