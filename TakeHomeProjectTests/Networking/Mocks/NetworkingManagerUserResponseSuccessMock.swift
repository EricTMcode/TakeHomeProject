//
//  NetworkingManagerUserResponseSuccessMock.swift
//  TakeHomeProjectTests
//
//  Created by Eric on 22/08/2023.
//

import Foundation
@testable import TakeHomeProject

class NetworkingManagerUserResponseSuccessMock: NetworkingManagerImpl {
    func request<T>(session: URLSession, _ endpoint: TakeHomeProject.Endpoint, type: T.Type) async throws -> T where T : Decodable, T : Encodable {
        return try StaticJSONMapper.decode(file: "UsersStaticData", type: UsersResponse.self) as! T
    }
    
    func request(session: URLSession, _ endpoint: TakeHomeProject.Endpoint) async throws {
        
    }
    
    
}
