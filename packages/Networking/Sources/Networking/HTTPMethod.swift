//
//  HTTPMethod.swift
//  DriverScoretest
//
//  Created by Lucas West-Rogers on 02/03/2025.
//

import Foundation

/// Although only `GET` is needed for this test, all fields are included for scalability.
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}
