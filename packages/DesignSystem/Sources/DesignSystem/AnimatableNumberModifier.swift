//
//  AnimatableNumberModifier.swift
//  DriverScoretest
//
//  Created by Lucas West-Rogers on 27/02/2025.
//

import SwiftUI

public struct AnimatableNumberModifier: Animatable, ViewModifier {
    var value: CGFloat

    nonisolated public var animatableData: CGFloat {
        get { value }
        set { value = newValue }
    }

    public func body(content: Content) -> some View {
        Text("\(Int(value))")
    }
}

public struct AnimatableNumberView: View {
    var value: CGFloat

    public init(value: CGFloat) { self.value = value }

    public var body: some View {
        Text("")
            .modifier(AnimatableNumberModifier(value: value))
    }
}
