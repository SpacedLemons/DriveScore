//
//  PrimaryButtonStyle.swift
//  DriverScoretest
//
//  Created by Lucas West-Rogers on 27/02/2025.
//

import SwiftUI

public extension ButtonStyle where Self == PrimaryButtonStyle {
    static func primaryStyle() -> PrimaryButtonStyle {
        PrimaryButtonStyle()
    }
}

public struct PrimaryButtonStyle: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .foregroundColor(.white)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .background(Color.blue.cornerRadius(8))
            .opacity(configuration.isPressed ? 0.7 : 1)
    }
}
