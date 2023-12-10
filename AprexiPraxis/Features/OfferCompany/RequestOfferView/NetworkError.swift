//
//  NetworkError.swift
//  AprexiPraxis
//
//  Created by user245647 on 21/11/23.
//

import Foundation

enum NetworkError: Error {
    case nilResponse
    case badUrl
    case encoding
    case response(Int)
}
