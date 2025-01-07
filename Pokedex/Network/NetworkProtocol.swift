//
//  NetworkProtocol.swift
//  Pokedex
//
//  Created by Gustavo Gutierrez on 04/01/25.
//

import Foundation

protocol NetworkProtocol {
    func request<T: Codable>(request: NetworkRouter) async throws -> T
}
