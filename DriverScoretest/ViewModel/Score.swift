//
//  Score.swift
//  DriverScoretest
//
//  Created by Lucas West-Rogers on 27/02/2025.
//

import Foundation

struct Score: Equatable {
    let score: Int
    let maxScore: Int

    var scoreFraction: CGFloat {
        guard maxScore != 0 else { return 0 }
        return CGFloat(score) / CGFloat(maxScore)
    }
}
