//
//  ServiceErrors.swift
//  Pokedex
//
//  Created by Gustavo Gutierrez on 04/01/25.
//

import Foundation

enum ServiceErrors: Error {
    case errorHttpsCode
    case badRequest
    case decodeError
    case genericError
}
