//
//  CreateViewModelSuccessTests.swift
//  TakeHomeProjectTests
//
//  Created by Eric on 25/08/2023.
//

import XCTest
@testable import TakeHomeProject

final class CreateViewModelSuccessTests: XCTestCase {

    private var networkingMock: NetworkingManagerImpl!
    private var validationMock: CreateValidatorImpl!
    private var vm: CreateViewModel!
    
    override func setUp() {
        networkingMock = NetworkingManagerCreateSuccessMock()
        validationMock = CreateValidatorSuccessMock()
        vm = CreateViewModel(networkingManager: networkingMock, validator: validationMock)
    }
    
    override func tearDown() {
        networkingMock = nil
        validationMock = nil
        vm = nil
    }
    
    func test_with_successful_response_submission_state_is_successful() async throws {
        
        XCTAssertNil(vm.state, "The view model should be nil initially")
        
        defer {
            XCTAssertEqual(vm.state, .successful, "THe view model should be successful")
        }
        
        await vm.create()
    }
}
