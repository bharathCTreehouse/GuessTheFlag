//
//  VerticalStackFlagFrameModifier.swift
//  GuessTheFlag
//
//  Created by Bharath Chandrashekar on 17/06/25.
//

import SwiftUI

struct VerticalStackFlagFrameModifier: ViewModifier {
    @ViewBuilder func body(content: Self.Content) -> some View {
        content.frame(maxWidth: .infinity).padding(.vertical, 20.0).background(.ultraThinMaterial).clipShape(.rect(cornerRadius: 20.0))
    }
}
