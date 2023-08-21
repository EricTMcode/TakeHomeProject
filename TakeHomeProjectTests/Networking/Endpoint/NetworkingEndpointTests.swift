//
//  NetworkingEndpointTests.swift
//  TakeHomeProjectTests
//
//  Created by Eric on 21/08/2023.
//

import XCTest
@testable import TakeHomeProject

final class NetworkingEndpointTests: XCTestCase {
    
    func test_with_people_endpoint_request_is_valid() {
        let endpoint = Endpoint.people(page: 1)
        
        XCTAssertEqual(endpoint.host, "reqres.in", "The host should be reqres.in")
        XCTAssertEqual(endpoint.path, "/api/users", "The path should be /api/users")
        XCTAssertEqual(endpoint.methodType, .GET, "The method type should be GET")
        XCTAssertEqual(endpoint.queryItems, ["page":"1"], "The query items should be page 1")
        
        XCTAssertEqual(endpoint.url?.absoluteString, "https://reqres.in/api/users?page=1&delay=1", "The generated URL doesn't match our endpoint")
        
    }
    
    func test_with_detail_endpoint_request_is_valid() {
        let userId = 1
        let endpoint = Endpoint.detail(id: 1)
        
        XCTAssertEqual(endpoint.host, "reqres.in", "The host should be reqres.in")
        XCTAssertEqual(endpoint.path, "/api/users/\(userId)", "The path should be /api/users/\(userId)")
        XCTAssertEqual(endpoint.methodType, .GET, "The method type should be GET")
        XCTAssertNil(endpoint.queryItems, "The query intems should be nil")
        
        XCTAssertEqual(endpoint.url?.absoluteString, "https://reqres.in/api/users/\(userId)?delay=1", "The generated URL doesn't match our endpoint")
    }
    
    func test_with_create_endpoint_request_is_valid() {
        let endpoint = Endpoint.create(submissionData: nil)
        
        XCTAssertEqual(endpoint.host, "reqres.in", "The host should be reqres.in")
        XCTAssertEqual(endpoint.path, "/api/users", "The path should be /api/users")
        XCTAssertEqual(endpoint.methodType, .POST(data: nil), "The method type should be POST")
        XCTAssertNil(endpoint.queryItems, "The query intems should be nil")
        
        XCTAssertEqual(endpoint.url?.absoluteString, "https://reqres.in/api/users?delay=1", "The generated URL doesn't match our endpoint")
    }

}
