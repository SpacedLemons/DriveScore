//
//  MockCreditFetcher.swift
//  Networking
//
//  Created by Lucas West on 03/03/2025.
//

import Foundation
import Networking

enum MockCreditFetcherError: Error {
    case missingMockData
}

public class MockCreditFetcher: CreditFetchable {
    public var mockCreditAccount: CreditAccount?
    public var session: URLSessionProtocol
    public var networkingError: NetworkingError?
    public private(set) var getCreditScoreCalled = 0

    public init(
        mockCreditAccount: CreditAccount? = nil,
        session: URLSessionProtocol = URLSession.shared,
        networkingError: NetworkingError? = nil
    ) {
        self.mockCreditAccount = mockCreditAccount
        self.session = session
        self.networkingError = networkingError
    }

    public func getCreditScore() async throws -> CreditAccount {
        getCreditScoreCalled += 1
        if let error = networkingError { throw error }
        if let account = mockCreditAccount { return account }
        throw MockCreditFetcherError.missingMockData
    }
}
