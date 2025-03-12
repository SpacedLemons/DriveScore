//
//  DonutView.swift
//  DriverScoretest
//
//  Created by Lucas West-Rogers on 27/02/2025.
//

import DesignSystem
import SwiftUI

struct DonutView: View {
    @State private var ringProgress = 0.0
    let score: Score

    var body: some View {
        VStack {
            ZStack {
                DonutRing(
                    progress: ringProgress,
                    ringColour: .green,
                    backgroundRingColour: Color.gray.opacity(0.2),
                    lineWidth: 20,
                    size: 200
                )
                HStack(alignment: .firstTextBaseline, spacing: 2) {
                    AnimatableNumberView(value: ringProgress * CGFloat(score.maxScore))
                        .font(.title2).bold()
                        .accessibilityIdentifier("scoreValue")
                    Text("/ \(score.maxScore)")
                        .font(.title2).bold()
                        .accessibilityIdentifier("maxScoreValue")
                }
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 2.5)) {
                ringProgress = score.scoreFraction
            }
        }
    }
}

#Preview("Filled Donut") { DonutView(score: Score(score: 700, maxScore: 700)) }
#Preview("Half Filled Donut") { DonutView(score: Score(score: 350, maxScore: 700)) }
#Preview("Empty Donut") { DonutView(score: Score(score: 0, maxScore: 700)) }
