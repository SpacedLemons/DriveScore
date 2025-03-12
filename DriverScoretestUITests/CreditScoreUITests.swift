//
//  CreditScoreViewUITests.swift
//  DriverScoretest
//
//  Created by Lucas West on 03/03/2025.
//

import XCTest

final class CreditScoreViewUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
    }

    func test_InitialIdleState() throws {
        // Given
        app.launch()

        // When
        let getCreditScoreButton = app.buttons["getCreditScoreButton"]

        // Then
        XCTAssertTrue(getCreditScoreButton.exists, "Get Credit Score button should be visible in idle state")
        XCTAssertTrue(getCreditScoreButton.isHittable, "Get Credit Score button should be hittable")
    }

    func test_LoadingState() throws {
        // Given
        app.launchArguments = ["UI_TESTING", "SHOW_LOADING"]
        app.launch()

        // When
        let loadingIndicator = app.activityIndicators["loadingIndicator"]
        let loadingText = app.staticTexts["Loading..."]

        // Then
        XCTAssertTrue(loadingIndicator.exists || loadingText.exists, "Loading indicator should be visible in loading state")
    }

    func test_LoadedState() throws {
        // Given
        app.launchArguments = ["UI_TESTING", "SHOW_LOADED"]
        app.launch()

        var donutViewExists = false
        let donutView = app.otherElements["donutView"]
        let anyDonutElement = app.descendants(matching: .any)["donutView"]

        if donutView.exists {
            donutViewExists = true
        } else if anyDonutElement.exists {
            donutViewExists = true
        }

        // Then
        XCTAssertTrue(donutViewExists, "Donut view should be visible in loaded state")

        let maxScoreText = app.staticTexts.containing(NSPredicate(format: "label CONTAINS '/ 700'")).firstMatch
        XCTAssertTrue(maxScoreText.exists, "Max score text should be visible")

        let expectation = XCTNSPredicateExpectation(
            predicate: NSPredicate(format: "exists == true"),
            object: app.staticTexts.element(boundBy: 0)
        )

        let result = XCTWaiter.wait(for: [expectation], timeout: 3.0)
        XCTAssertEqual(result, .completed, "Should have at least one text element visible")
    }

    func test_ErrorState() throws {
        // Given
        app.launchArguments = ["UI_TESTING", "SHOW_ERROR"]
        app.launch()

        // When
        let retryButton = app.buttons["retryButton"]
        let cancelButton = app.buttons["cancelButton"]
        let errorMessage = app.staticTexts["errorMessage"]

        // Then
        XCTAssertTrue(errorMessage.exists, "Error message should be visible in error state")
        XCTAssertTrue(retryButton.exists, "Retry button should be visible")
        XCTAssertTrue(cancelButton.exists, "Cancel button should be visible")
        XCTAssertTrue(retryButton.isHittable, "Retry button should be hittable")
        XCTAssertTrue(cancelButton.isHittable, "Cancel button should be hittable")
    }

    func test_ErrorToIdleTransition() throws {
        // Given
        app.launchArguments = ["UI_TESTING", "SHOW_ERROR"]
        app.launch()

        // When
        let cancelButton = app.buttons["cancelButton"]
        XCTAssertTrue(cancelButton.exists, "Cancel button should be visible")
        cancelButton.tap()

        // Then
        let getCreditScoreButton = app.buttons["getCreditScoreButton"]
        let expectation = XCTNSPredicateExpectation(
            predicate: NSPredicate(format: "exists == true"),
            object: getCreditScoreButton
        )

        let result = XCTWaiter.wait(for: [expectation], timeout: 2.0)
        XCTAssertEqual(result, .completed, "Should transition back to idle state")
    }
}
