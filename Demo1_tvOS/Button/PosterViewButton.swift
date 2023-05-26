//
//  PosterViewButton.swift
//  Demo1_tvOS
//
//  Created by visit on 2023/5/26.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct PosterViewButton: View {
  @FocusState var isFocused

  var body: some View {
      Button(
          action: { },
          label: {
              VStack(spacing: 4) {
                  Image(systemName: "bolt.circle")
                      .resizable()
                      .scaledToFill()
                      .frame(width: 200, height: 125)
                      .clipped()
                      .shadow(radius: 18, x: 0, y: isFocused ? 50 : 0)

                  Text("Title")
                      .foregroundColor(isFocused ? .white : .black)

              }
          }
      )
      .focused($isFocused)
      .buttonStyle(PressHandlingStyle())
      .scaleEffect(isFocused ? 1.2 : 1)
      .animation(.easeOut(duration: isFocused ? 0.12 : 0.35), value: isFocused)
  }
}

struct PosterView_Button_Previews: PreviewProvider {
    static var previews: some View {
        PosterViewButton()
    }
}

struct PressHandlingStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? (1 / 1.15) : 1)
    }
}
