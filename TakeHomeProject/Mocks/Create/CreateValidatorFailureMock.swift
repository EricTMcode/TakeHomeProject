//
//  CreateValidatorFailureMock.swift
//  TakeHomeProjectTests
//
//  Created by Eric on 25/08/2023.
//

#if DEBUG
import Foundation

struct CreateValidatorFailureMock: CreateValidatorImpl {
    func validate(_ person: TakeHomeProject.NewPerson) throws {
        throw CreateValidator.CreateValidatorError.invalidFirstName
    }
}
#endif
