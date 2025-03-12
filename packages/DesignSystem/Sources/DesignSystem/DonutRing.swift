//
//  DonutRing.swift
//  DriverScoretest
//
//  Created by Lucas West-Rogers on 27/02/2025.
//

import SwiftUI

public struct DonutRing: View {
    var progress: CGFloat
    var ringColour: Color
    var backgroundRingColour: Color
    var lineWidth: CGFloat
    var size: CGFloat

    public init(
        progress: CGFloat,
        ringColour: Color,
        backgroundRingColour: Color,
        lineWidth: CGFloat,
        size: CGFloat
    ) {
        self.progress = progress
        self.ringColour = ringColour
        self.backgroundRingColour = backgroundRingColour
        self.lineWidth = lineWidth
        self.size = size
    }

    public var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: lineWidth)
                .foregroundColor(backgroundRingColour)
                .frame(width: size, height: size)
            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                .foregroundColor(ringColour)
                .frame(width: size, height: size)
                .rotationEffect(.degrees(-90))
        }
    }
}
