//
//  Models.swift
//  TakeHomeProject
//
//  Created by Eric on 06/08/2023.
//


// MARK: - User
struct User: Codable, Equatable {
    let id: Int
    let email, firstName, lastName: String
    let avatar: String
    
    static var example = User(id: 109, email: "eric@gmail.com", firstName: "Eric", lastName: "Barto", avatar: "https://reqres.in/img/faces/2-image.jpg")
}

// MARK: - Support
struct Support: Codable, Equatable {
    let url: String
    let text: String
}
