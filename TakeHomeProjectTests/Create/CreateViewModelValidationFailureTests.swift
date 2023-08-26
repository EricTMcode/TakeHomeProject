//
//  CreateViewModelValidationFailureTests.swift
//  TakeHomeProjectTests
//
//  Created by Eric on 25/08/2023.
//

import XCTest
@testable import TakeHomeProject

final class CreateViewModelValidationFailureTests: XCTestCase {
    
    private var networkingMock: NetworkingManagerImpl!
    private var validationMock: CreateValidatorImpl!
    private var vm: CreateViewModel!
    
    override func setUp() {
        networkingMock = NetworkingManagerCreateSuccessMock()
        validationMock = CreateValidatorFailureMock()
        vm = CreateViewModel(networkingManager: networkingMock, validator: validationMock)
    }
    
    override func tearDown() {
        networkingMock = nil
        validationMock = nil
        vm = nil
    }
    
    func test_with_invalid_form_submission_state_is_invalid() async {
        
        XCTAssertNil(vm.state, "The view model should be nil initialy")
        defer { XCTAssertEqual(vm.state, .unsuccessful, "The view model state should be unsucessful") }
        
        await vm.create()
        
        XCTAssertTrue(vm.hasError, "The view model should have an error")
        XCTAssertNotNil(vm.error, "The view model error property shouldn't be nil")
        XCTAssertEqual(vm.error, .validation(error: CreateValidator.CreateValidatorError.invalidFirstName), "The view model error should be invalid first name")
    }
}
