//
//  Untitled.swift
//  GuessTheFlag
//
//  Created by Bharath Chandrashekar on 17/06/25.
//

import SwiftUI

struct FlagImageView: View {
    let flagImageName: String
    var body: some View {
        Image(flagImageName).clipShape(.capsule).shadow(radius: 5)
    }
}

//#Preview {
//    FlagImageView(flagImageName: "Germany")
//}
