//
//  UITestService.swift
//  DriverScoretest
//
//  Created by Lucas West on 11/03/2025.
//

import Foundation

protocol UITestServiceProtocol {
    var isUITesting: Bool { get }
    var initialLoadState: LoadState? { get }
}

struct UITestService: UITestServiceProtocol {
    var isUITesting: Bool {
        CommandLine.arguments.contains("UI_TESTING")
    }
    
    var initialLoadState: LoadState? {
        if !isUITesting { return nil }

        if CommandLine.arguments.contains("SHOW_LOADING") {
            return .loading
        } else if CommandLine.arguments.contains("SHOW_LOADED") {
            return .loaded(Score(score: 514, maxScore: 700))
        } else if CommandLine.arguments.contains("SHOW_ERROR") {
            return .failed(.network)
        }
        
        return nil
    }
}
