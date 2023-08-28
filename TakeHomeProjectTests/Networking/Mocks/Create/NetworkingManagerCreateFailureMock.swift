//
//  NetworkingManagerCreateFailureMock.swift
//  TakeHomeProjectTests
//
//  Created by Eric on 26/08/2023.
//

#if DEBUG
import Foundation

class NetworkingManagerCreateFailureMock: NetworkingManagerImpl {
    
    func request<T>(session: URLSession, _ endpoint: TakeHomeProject.Endpoint, type: T.Type) async throws -> T where T : Decodable, T : Encodable {
        return Data() as! T
    }
    
    func request(session: URLSession, _ endpoint: TakeHomeProject.Endpoint) async throws {
        throw NetworkingManager.NetworkingError.invalidUrl
    }
}
#endif
