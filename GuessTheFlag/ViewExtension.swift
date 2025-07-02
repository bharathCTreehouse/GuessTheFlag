//
//  ViewExtension.swift
//  GuessTheFlag
//
//  Created by Bharath Chandrashekar on 18/06/25.
//

import SwiftUI

extension View {
    var vertStackFlagFrame: some View {
        return modifier(VerticalStackFlagFrameModifier())
    }
}
