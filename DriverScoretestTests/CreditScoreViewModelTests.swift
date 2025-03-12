//
//  CreditScoreViewModelTests.swift
//  Networking
//
//  Created by Lucas West-Rogers on 02/03/2025.
//

import XCTest
@testable import DriverScoretest
@testable import Networking
@testable import NetworkingMocks

@MainActor
final class CreditScoreViewModelTests: XCTestCase {
    var sut: CreditScoreViewModel!
    var fetcher: MockCreditFetcher!
    var networkingError: NetworkingError?
    var creditAccount: CreditAccount!

    override func setUp() {
        creditAccount = CreditAccount.mockCreditAccount()
        fetcher = MockCreditFetcher(mockCreditAccount: creditAccount)
        sut = CreditScoreViewModel(fetcher: fetcher)
        super.setUp()
    }

    override func tearDown() {
        sut = nil
        fetcher = nil
        super.tearDown()
    }

    func test_WhenGetCreditScoreIsInvoked_ThenFetcherIsCalled() async throws {
        // Given
        fetcher = MockCreditFetcher(mockCreditAccount: creditAccount)
        sut = CreditScoreViewModel(fetcher: fetcher)
        XCTAssertEqual(sut.loadState, .idle)

        // When
        try await sut.getCreditScore()

        // Then
        XCTAssertEqual(fetcher.getCreditScoreCalled, 1)
        if case let .loaded(score) = sut.loadState {
            XCTAssertEqual(score.score, creditAccount.creditReportInfo.score)
            XCTAssertEqual(score.maxScore, creditAccount.creditReportInfo.maxScoreValue)
        } else {
            XCTFail("Load state is not loaded")
        }
    }

    func test_WhenGetCreditScoreFails_ThenLoadStateIsFailed() async throws {
        // Given
        fetcher = MockCreditFetcher()
        fetcher.networkingError = .network
        sut = CreditScoreViewModel(fetcher: fetcher)
        XCTAssertEqual(sut.loadState, .idle)

        // When
        try await sut.getCreditScore()

        // Then
        XCTAssertEqual(fetcher.getCreditScoreCalled, 1)
        XCTAssertEqual(sut.loadState, .failed(.network))
    }
}
