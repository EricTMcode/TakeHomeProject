//
//  UserDetailResponse.swift
//  TakeHomeProject
//
//  Created by Eric on 06/08/2023.
//

// MARK: - UserDetailResponse
struct UserDetailResponse: Codable, Equatable {
    let data: User
    let support: Support
}

