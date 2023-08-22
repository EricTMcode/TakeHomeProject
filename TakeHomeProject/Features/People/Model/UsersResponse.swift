//
//  UsersResponse.swift
//  TakeHomeProject
//
//  Created by Eric on 06/08/2023.
//

// MARK: - UsersResponse
struct UsersResponse: Codable, Equatable {
    let page, perPage, total, totalPages: Int
    let data: [User]
    let support: Support
}

