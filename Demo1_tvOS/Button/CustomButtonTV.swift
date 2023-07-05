//
//  CustomButtonTV.swift
//  Demo1_tvOS
//
//  Created by visit on 2023/5/26.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct CustomButtonTV: View {
  @FocusState var isFocused
  
  var text: String

    var body: some View {
      Button(
        action: { },
        label: {
            VStack {
                Text(text)
                .foregroundColor(isFocused ? Color.red : Color.blue)
            }
            .frame(maxWidth: .infinity)
        }
      )
      .frame(maxWidth: .infinity)
      .frame(height: 80)
      .background(isFocused ? Color.green : Color(UIColor.white.withAlphaComponent(0.0)))
      .buttonStyle(CustomButtonTVStyle())
      .cornerRadius(10)
      .focused($isFocused, equals: true)
      .onChange(of: isFocused) { newValue in
        isFocused = newValue
      }
    }
}

struct CustomButtonTV_Previews: PreviewProvider {
    static var previews: some View {
      CustomButtonTV(text: "adeasdasd")
    }
}

struct CustomButtonTVStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? (1 / 1.15) : 1)
            .background(configuration.isPressed ? Color.green : Color(UIColor.white.withAlphaComponent(0.0)))

    }
}
