//
//  CreateValidatorSuccessMock.swift
//  TakeHomeProjectTests
//
//  Created by Eric on 25/08/2023.
//

import Foundation
@testable import TakeHomeProject

struct CreateValidatorSuccessMock: CreateValidatorImpl {
   
    func validate(_ person: TakeHomeProject.NewPerson) throws {}
}
