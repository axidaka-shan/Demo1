//
//  CustomCardButtonTV.swift
//  Demo1_tvOS
//
//  Created by visit on 2023/5/26.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct CustomCardButtonTV<T: PrimitiveButtonStyle>: View {
  @FocusState var isFocused
  
  var text: String
  var style: T

    var body: some View {
      Button(
        action: { },
        label: {
            VStack {
                Text(text)
                .foregroundColor(isFocused ? Color.red : Color.blue)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            .background(isFocused ? Color.green : Color(UIColor.white.withAlphaComponent(0.0)))
        }
      )
      .frame(maxWidth: .infinity)
      .frame(height: 100)
      .background(isFocused ? Color.green : Color(UIColor.white.withAlphaComponent(0.0)))
      .buttonStyle(style)
      .focused($isFocused, equals: true)
      .onChange(of: isFocused) { newValue in
        isFocused = newValue
      }
    }
}

struct CustomCardButtonTV_Previews: PreviewProvider {
    static var previews: some View {
      CustomCardButtonTV(text: "adeasdasd", style: .card)
    }
}
