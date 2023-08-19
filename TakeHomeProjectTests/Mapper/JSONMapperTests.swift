//
//  JSONMapperTests.swift
//  TakeHomeProjectTests
//
//  Created by Eric on 19/08/2023.
//

import Foundation
import XCTest
@testable import TakeHomeProject

class JSONMapperTests: XCTestCase {
    
    func test_with_valid_json_successfully_decodes() {
        XCTAssertNoThrow(try StaticJSONMapper.decode(file: "UsersStaticData", type: UsersResponse.self), "Mapper shouldn't throw an error")
        
        let userResponse = try? StaticJSONMapper.decode(file: "UsersStaticData", type: UsersResponse.self)
        XCTAssertNotNil(userResponse, "User response shouldn't be nil")
        
        XCTAssertEqual(userResponse?.page, 1, "Page number should be 1")
        XCTAssertEqual(userResponse?.perPage, 6, "Page number should be 6")
        XCTAssertEqual(userResponse?.total, 12, "Total page should be 12")
        XCTAssertEqual(userResponse?.totalPages, 2, "Total pages should be 2")
        
        XCTAssertEqual(userResponse?.data.count, 6, "The total number of users should be 6")
        
        XCTAssertEqual(userResponse?.data[0].id, 1, "The id should be 1")
        XCTAssertEqual(userResponse?.data[0].email, "george.bluth@reqres.in", "The email should be george.bluth@reqres.in")
        XCTAssertEqual(userResponse?.data[0].firstName, "George", "The first name should be George")
        XCTAssertEqual(userResponse?.data[0].lastName, "Bluth", "The last name should be Bluth")
        XCTAssertEqual(userResponse?.data[0].avatar, "https://reqres.in/img/faces/1-image.jpg", "The url should be https://reqres.in/img/faces/1-image.jpg")
        
        XCTAssertEqual(userResponse?.data[4].id, 5, "The id should be 5")
        XCTAssertEqual(userResponse?.data[4].email, "charles.morris@reqres.in", "The email should be charles.morris@reqres.in")
        XCTAssertEqual(userResponse?.data[4].firstName, "Charles", "The first name should be Charles")
        XCTAssertEqual(userResponse?.data[4].lastName, "Morris", "The last name should be Morris")
        XCTAssertEqual(userResponse?.data[4].avatar, "https://reqres.in/img/faces/5-image.jpg", "The url should be https://reqres.in/img/faces/5-image.jpg")
        
    }
    
    func test_with_missing_files_error_thrown() {
        XCTAssertThrowsError(try StaticJSONMapper.decode(file: "", type: UsersResponse.self), "An error should be thrown")
        do {
            _ = try StaticJSONMapper.decode(file: "", type: UsersResponse.self)
        } catch {
            guard let mappingError = error as? StaticJSONMapper.MappingError else {
                XCTFail("This is the wrong type of error for missing files")
                return
            }
            XCTAssertEqual(mappingError, StaticJSONMapper.MappingError.failedToGetContents, "This should be a failed to get contents error")
        }
    }
    
    func test_with_invalid_file_error_thrown() {
        XCTAssertThrowsError(try StaticJSONMapper.decode(file: "gfsdgsdf", type: UsersResponse.self), "An error should be thrown")
        do {
            _ = try StaticJSONMapper.decode(file: "gfsdgsdf", type: UsersResponse.self)
        } catch {
            guard let mappingError = error as? StaticJSONMapper.MappingError else {
                XCTFail("This is the wrong type of error for missing files")
                return
            }
            XCTAssertEqual(mappingError, StaticJSONMapper.MappingError.failedToGetContents, "This should be a failed to get contents error")
        }
    }
    
    func test_with_invalid_json_error_thrown() {
        XCTAssertThrowsError(try StaticJSONMapper.decode(file: "UsersStaticData", type: UserDetailResponse.self), "An error should be thrown")
        do {
            _ = try StaticJSONMapper.decode(file: "UsersStaticData", type: UserDetailResponse.self)
        } catch {
            if error is StaticJSONMapper.MappingError {
                XCTFail("Got the wrong type of error, expecting a system decoding error")
            }
        }
    }
}
