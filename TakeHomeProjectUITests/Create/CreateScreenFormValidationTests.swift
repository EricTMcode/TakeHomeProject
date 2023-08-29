//
//  CreateScreenFormValidationTests.swift
//  TakeHomeProjectUITests
//
//  Created by Eric on 28/08/2023.
//

import XCTest

final class CreateScreenFormValidationTests: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["-ui-testing"]
        app.launchEnvironment = ["-people-networking-success":"1"]
        app.launch()
    }
    
    override func tearDown() {
        app = nil
    }
    
    func test_when_all_form_fields_is_empty_first_name_error_is_shown() {
        
        let createBtn = app.buttons["createBtn"]
        XCTAssertTrue(createBtn.waitForExistence(timeout: 5), "The create button should be visible on the screen")
        
        createBtn.tap()
        
        let submitBtn = app.buttons["submitBtn"]
        XCTAssertTrue(submitBtn.waitForExistence(timeout: 5), "The submit button should be visible on the screen")
        
        submitBtn.tap()
        
        let alert = app.alerts.firstMatch
        let alertBtn = alert.buttons.firstMatch
        
        XCTAssertTrue(alert.waitForExistence(timeout: 5), "There should be an alert on the screen")
        XCTAssertTrue(alert.staticTexts["First name can't be empty"].exists)
        XCTAssertEqual(alertBtn.label, "OK", "The button should show OK")
        
        alertBtn.tap()
        
        XCTAssertTrue(app.staticTexts["First name can't be empty"].exists)
        XCTAssertEqual(app.alerts.count, 0, "There should be no alerts on the screen")
        
    }
    
    func test_when_first_name_form_field_is_empty_first_name_error_is_shown() {
        
        let createBtn = app.buttons["createBtn"]
        XCTAssertTrue(createBtn.waitForExistence(timeout: 5), "The create button should be visible on the screen")
        
        createBtn.tap()
        
        let lastnameTxtField = app.textFields["lastNameTxtfield"]
        let jobTxtField = app.textFields["jobTxtField"]
        
        lastnameTxtField.tap()
        lastnameTxtField.typeText("Eric")
        
        jobTxtField.tap()
        jobTxtField.typeText("iOS Developer")
        
        let submitBtn = app.buttons["submitBtn"]
        XCTAssertTrue(submitBtn.waitForExistence(timeout: 5), "The submit button should be visible on the screen")
        
        submitBtn.tap()
        
        let alert = app.alerts.firstMatch
        let alertBtn = alert.buttons.firstMatch
        
        XCTAssertTrue(alert.waitForExistence(timeout: 5), "There should be an alert on the screen")
        XCTAssertTrue(alert.staticTexts["First name can't be empty"].exists)
        XCTAssertEqual(alertBtn.label, "OK", "The button should show OK")
        
        alertBtn.tap()
        
        XCTAssertTrue(app.staticTexts["First name can't be empty"].exists)
        XCTAssertEqual(app.alerts.count, 0, "There should be no alerts on the screen")
    }
    
    func test_when_last_name_form_field_is_empty_last_name_error_is_shown() {
        
        let createBtn = app.buttons["createBtn"]
        XCTAssertTrue(createBtn.waitForExistence(timeout: 5), "The create button should be visible on the screen")
        
        createBtn.tap()
        
        let firstnameTxtField = app.textFields["firstNameTxtfield"]
        let jobTxtField = app.textFields["jobTxtField"]
        
        firstnameTxtField.tap()
        firstnameTxtField.typeText("Code")
        
        jobTxtField.tap()
        jobTxtField.typeText("iOS Developer")
        
        let submitBtn = app.buttons["submitBtn"]
        XCTAssertTrue(submitBtn.waitForExistence(timeout: 5), "The submit button should be visible on the screen")
        
        submitBtn.tap()
        
        let alert = app.alerts.firstMatch
        let alertBtn = alert.buttons.firstMatch
        
        XCTAssertTrue(alert.waitForExistence(timeout: 5), "There should be an alert on the screen")
        XCTAssertTrue(alert.staticTexts["Last name can't be empty"].exists)
        XCTAssertEqual(alertBtn.label, "OK", "The button should show OK")
        
        alertBtn.tap()
        
        XCTAssertTrue(app.staticTexts["Last name can't be empty"].exists)
        XCTAssertEqual(app.alerts.count, 0, "There should be no alerts on the screen")
    }
    
    func test_when_job_form_field_is_empty_job_error_is_shown() {
        
        let createBtn = app.buttons["createBtn"]
        XCTAssertTrue(createBtn.waitForExistence(timeout: 5), "The create button should be visible on the screen")
        
        createBtn.tap()
        
        let firstnameTxtField = app.textFields["firstNameTxtfield"]
        let lastnameTxtField = app.textFields["lastNameTxtfield"]
        
        firstnameTxtField.tap()
        firstnameTxtField.typeText("Code")
        
        lastnameTxtField.tap()
        lastnameTxtField.typeText("Eric")
        
        let submitBtn = app.buttons["submitBtn"]
        XCTAssertTrue(submitBtn.waitForExistence(timeout: 5), "The submit button should be visible on the screen")
        
        submitBtn.tap()
        
        let alert = app.alerts.firstMatch
        let alertBtn = alert.buttons.firstMatch
        
        XCTAssertTrue(alert.waitForExistence(timeout: 5), "There should be an alert on the screen")
        XCTAssertTrue(alert.staticTexts["Job can't be empty"].exists)
        XCTAssertEqual(alertBtn.label, "OK", "The button should show OK")
        
        alertBtn.tap()
        
        XCTAssertTrue(app.staticTexts["Job can't be empty"].exists)
        XCTAssertEqual(app.alerts.count, 0, "There should be no alerts on the screen")
    }
}
