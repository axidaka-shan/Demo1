//
//  RoundButton.swift
//  Demo1_tvOS
//
//  Created by visit146 on 2023/5/17.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct RoundButton: View {
    @FocusState var isFocused

    var body: some View {
        Button(
            action: { },
            label: {
                Image(systemName: "play")
                    .foregroundColor(isFocused ? Color.black : Color.white)
                    .font(.headline)
                    .padding(25)
                    .background(isFocused ? Color.white : Color.gray)
                    .clipShape(Circle())
                    .shadow(radius: isFocused ? 20 : 0, x: 0, y: isFocused ? 20 : 0)
            }
        )
        .focused($isFocused)
        .buttonStyle(PressHandlingStyle2())
        .scaleEffect(isFocused ? 1.2 : 1)
        .animation(.easeOut(duration: isFocused ? 0.12 : 0.35), value: isFocused)
    }
}

// We use this button style to handle the `isPressed` state of the component.
struct PressHandlingStyle2: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? (1 / 1.15) : 1)
    }
}
