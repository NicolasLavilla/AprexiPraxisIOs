//
//  OfferCompanyDetailViewModel.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//

import Foundation

class OfferCompanyDetailViewModel: ObservableObject {
    
    private let offerCompanyRepository: OfferCompanyRepository
    
    @Published var isLoading = false
    @Published var isFollowed = false
    @Published var isRequest = false
    @Published var offer: Offer?
    @Published var insertFollowOffer: InsertFollowOfferUser?
    @Published var insertRequestOffer: InsertRequestOfferUser?
    @Published var deleteFollowOffer: DeleteFollowOfferUser?
    @Published var error: Error?
    
    init(offerCompanyRepository: OfferCompanyRepository) {
        self.offerCompanyRepository = offerCompanyRepository
    }
    
    @MainActor
    func getOfferCompany(idOffer: Int,idUser: Int, token: String) async {
        error = nil
        isLoading = true
        
        do {
            offer = try await offerCompanyRepository.getOfferCompany(idOffer: idOffer ,idUser: idUser, token: token)
            isFollowed = offer?.followOffer == 1
            isRequest = offer?.requestOffer == 1
        } catch {
            print("Error:", error)
            self.error = error
        }
        
        isLoading = false
    }
    
    func setInsertFollowOffer(idOffer: Int,idUser: Int, token: String) async {
        error = nil
        isLoading = true
        
        do {
            insertFollowOffer = try await offerCompanyRepository.setInsertFollowOffer(idUser: idUser, idOffer: idOffer, token: token)
            isFollowed = insertFollowOffer?.success == true

        } catch {
            print("Error:", error)
            self.error = error
        }
        
        isLoading = false
    }
    
    func setDeleteFollowOffer(idOffer: Int,idUser: Int, token: String) async {
        error = nil
        isLoading = true
        
        do {
            deleteFollowOffer = try await offerCompanyRepository.setDeleteFollowOffer(idUser: idUser, idOffer: idOffer, token: token)
            isFollowed = deleteFollowOffer?.success == false
        } catch {
            print("Error:", error)
            self.error = error
        }
        
        isLoading = false
    }
    
    func setInsertRequestOffer(idOffer: Int,idUser: Int, token: String) async {
        error = nil
        isLoading = true
        
        do {
            insertRequestOffer = try await offerCompanyRepository.setInsertRequestOffer(idUser: idUser, idOffer: idOffer, token: token)
            isRequest = insertFollowOffer?.success == true
            print("isRequest: " + String(isRequest))
        } catch {
            print("Error:", error)
            self.error = error
        }
        
        isLoading = false
    }
}
