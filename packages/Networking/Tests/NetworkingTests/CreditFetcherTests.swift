//
//  CreditFetcherTests.swift
//  Networking
//
//  Created by Lucas West-Rogers on 02/03/2025.
//

import XCTest
import Networking
import NetworkingMocks

final class CreditFetcherTests: XCTestCase {
    var sut: CreditFetcher!
    var mockSession: MockURLSession!
    var creditAccount: CreditAccount!

    override func setUp() {
        super.setUp()
        mockSession = MockURLSession()
        sut = CreditFetcher(
            session: mockSession,
            endpoint: Endpoints.creditValues.getEndpoint()
        )
    }

    override func tearDown() {
        sut = nil
        mockSession = nil
        super.tearDown()
    }

    // MARK: - Credit Score Success
    func test_GetCreditScoreSuccess() async {
        // Given
        let expectedAccount = CreditAccount.mockCreditAccount()
        mockSession.data = try? JSONEncoder().encode(expectedAccount)
        mockSession.response = HTTPURLResponse(
            url: Endpoints.creditValues.getEndpoint().makeRequestComponents().url!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )

        do {
            // When
            let result = try await sut.getCreditScore()

            // Then
            XCTAssertEqual(result.creditReportInfo.score, expectedAccount.creditReportInfo.score)
            XCTAssertEqual(result.creditReportInfo.maxScoreValue, expectedAccount.creditReportInfo.maxScoreValue)
        } catch {
            XCTFail("Failed to get credit score: \(error)")
        }
    }

    // MARK: - Network Error
    func test_NetworkErrorHandling() async {
        // Given
        mockSession.error = URLError(.notConnectedToInternet)

        sut = CreditFetcher(
            session: mockSession,
            endpoint: Endpoints.creditValues.getEndpoint()
        )

        // When/Then
        do {
            _ = try await sut.getCreditScore()
            XCTFail("Should throw network error")
        } catch {
            guard let netError = error as? NetworkingError else {
                return XCTFail("Wrong error type")
            }
            XCTAssertEqual(netError, .network)
        }
    }

    // MARK: - Parsing Error
    func test_ParsingErrorHandling() async {
        // Given
        mockSession.data = Data("Invalid JSON".utf8)
        mockSession.response = HTTPURLResponse(
            url: URL(string: "https://test.com")!,
            statusCode: 200,
            httpVersion: nil,
            headerFields: nil
        )

        // When/Then
        do {
            _ = try await sut.getCreditScore()
            XCTFail("Should throw parsing error")
        } catch {
            guard let netError = error as? NetworkingError else {
                return XCTFail("Wrong error type")
            }
            XCTAssertEqual(netError, .parsing)
        }
    }

    // MARK: - Test Mock Data Generation
    func test_MockDataGeneration() {
        // When
        let mockAccount = MockCreditFetcher.mockCreditAccount(
            changeInShortTermDebt: 100,
            hasEverDefaulted: true
        )

        // Then
        XCTAssertEqual(mockAccount.creditReportInfo.changeInShortTermDebt, 100)
        XCTAssertTrue(mockAccount.creditReportInfo.hasEverDefaulted)
        XCTAssertEqual(mockAccount.creditReportInfo.maxScoreValue, 700)
    }
}
