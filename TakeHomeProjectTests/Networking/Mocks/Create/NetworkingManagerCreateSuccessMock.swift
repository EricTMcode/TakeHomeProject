//
//  NetworkingManagerCreateSuccessMock.swift
//  TakeHomeProjectTests
//
//  Created by Eric on 25/08/2023.
//

import Foundation
@testable import TakeHomeProject

class NetworkingManagerCreateSuccessMock: NetworkingManagerImpl {
    
    func request<T>(session: URLSession, _ endpoint: TakeHomeProject.Endpoint, type: T.Type) async throws -> T where T : Decodable, T : Encodable {
        return Data() as! T
    }
    
    func request(session: URLSession, _ endpoint: TakeHomeProject.Endpoint) async throws {}
}
