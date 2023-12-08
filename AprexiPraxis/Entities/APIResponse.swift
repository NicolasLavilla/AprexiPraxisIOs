//
//  APIResponse.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//
import Foundation

struct APIResponse<T: Decodable>: Decodable {
    let results: [T]
}
