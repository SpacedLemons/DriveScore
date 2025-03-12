//
//  NetworkingError.swift
//  DriverScoretest
//
//  Created by Lucas West-Rogers on 27/02/2025.
//

import Foundation

public enum NetworkingError: Error, Equatable {
    case url
    case network
    case parsing
    case unknown
}
