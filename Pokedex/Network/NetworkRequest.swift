//
//  NetworkRequest.swift
//  Pokedex
//
//  Created by Gustavo Gutierrez on 04/01/25.
//

import Foundation

class NetworkRequest: NetworkProtocol {
    
    private let api: String = "https://pokeapi.co/api/v2/"
    
    func request<T: Codable>(request: NetworkRouter) async throws -> T {
        
        let urlString: String = api + request.path
        let url: URL = URL(string: urlString)!
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = request.httpMethod
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ServiceErrors.errorHttpsCode
        }
        switch httpResponse.statusCode {
        case 200:
            do {
                let decodeObject = try JSONDecoder().decode(T.self, from: data)
                return decodeObject
            } catch {
                throw ServiceErrors.decodeError
            }
        default:
            throw ServiceErrors.badRequest
        }
    }
}
