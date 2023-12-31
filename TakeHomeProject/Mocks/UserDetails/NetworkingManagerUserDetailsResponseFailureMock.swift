//
//  NetworkingManagerUserDetailsResponseFailureMock.swift
//  TakeHomeProjectTests
//
//  Created by Eric on 25/08/2023.
//

#if DEBUG
import Foundation

class NetworkingManagerUserDetailsResponseFailureMock: NetworkingManagerImpl {
    func request<T>(session: URLSession, _ endpoint: TakeHomeProject.Endpoint, type: T.Type) async throws -> T where T : Decodable, T : Encodable {
        throw NetworkingManager.NetworkingError.invalidUrl
    }
    
    func request(session: URLSession, _ endpoint: TakeHomeProject.Endpoint) async throws {
    }
}
#endif
