//
//  MockUITestService.swift
//  DriverScoretest
//
//  Created by Lucas West on 11/03/2025.
//

import Foundation
@testable import DriverScoretest

struct MockUITestService: UITestServiceProtocol {
    let isUITesting: Bool
    let initialLoadState: LoadState?
    
    init(isUITesting: Bool = false, initialLoadState: LoadState? = nil) {
        self.isUITesting = isUITesting
        self.initialLoadState = initialLoadState
    }
}
