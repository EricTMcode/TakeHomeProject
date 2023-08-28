//
//  NetworkingManagerUserDetailsResponseSuccessMock.swift
//  TakeHomeProjectTests
//
//  Created by Eric on 25/08/2023.
//

#if DEBUG
import Foundation

class NetworkingManagerUserDetailsResponseSuccessMock: NetworkingManagerImpl {
    func request<T>(session: URLSession, _ endpoint: TakeHomeProject.Endpoint, type: T.Type) async throws -> T where T : Decodable, T : Encodable {
        return try StaticJSONMapper.decode(file: "SingleUserData", type: UserDetailResponse.self) as! T
    }
    
    func request(session: URLSession, _ endpoint: TakeHomeProject.Endpoint) async throws {
    }
}
#endif
