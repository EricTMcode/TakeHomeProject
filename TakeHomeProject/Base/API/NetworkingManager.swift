//
//  NetworkingManager.swift
//  TakeHomeProject
//
//  Created by Eric on 15/08/2023.
//

import Foundation

final class NetworkingManager {
    
    static let shared = NetworkingManager()
    
    private init() {}
    
    func request<T: Codable>(_ endpoint: Endpoint, type: T.Type) async throws -> T {
        
        guard let url = endpoint.url else {
            throw NetworkingError.invalidUrl
        }
        
        let request = buildRequest(from: url, methodType: endpoint.methodType)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse,
              (200...300) ~= response.statusCode else {
            let statusCode = (response as! HTTPURLResponse).statusCode
            throw NetworkingError.invalidStatusCode(statusCode: statusCode)
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let res = try decoder.decode(T.self, from: data)
        
        return res
        
        
    }
    
    func request(_ endpoint: Endpoint) async throws {
        
        guard let url = endpoint.url else {
            throw NetworkingError.invalidUrl
        }
        
        let request = buildRequest(from: url, methodType: endpoint.methodType)
        
        let (_, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse,
              (200...300) ~= response.statusCode else {
            let statusCode = (response as! HTTPURLResponse).statusCode
            throw NetworkingError.invalidStatusCode(statusCode: statusCode)
        }
    }
}

extension NetworkingManager {
    enum NetworkingError: LocalizedError {
        case invalidUrl
        case custom(error: Error)
        case invalidStatusCode(statusCode: Int)
        case invalidData
        case failedToDecode(error: Error)
    }
}

extension NetworkingManager.NetworkingError {
    var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return "URL isn't valid"
        case .custom(let err):
            return "Something went wrong \(err.localizedDescription)"
        case .invalidStatusCode:
            return "Status code falls into the wrong range"
        case .invalidData:
            return "Response data is invalid"
        case .failedToDecode:
            return "Failed to decode"
        }
    }
}



private extension NetworkingManager {
    func buildRequest(from url: URL, methodType: Endpoint.MethodType) -> URLRequest {
        var request = URLRequest(url: url)
        
        switch methodType {
        case .GET:
            request.httpMethod = "GET"
        case .POST(let data):
            request.httpMethod = "POST"
            request.httpBody = data
        }
        return request
    }
}
