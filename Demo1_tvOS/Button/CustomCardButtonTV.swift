//
//  CustomCardButtonTV.swift
//  Demo1_tvOS
//
//  Created by visit on 2023/5/26.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct CustomCardButtonTV: View {
  @FocusState var isFocused

    var body: some View {
      Button(
        action: { },
        label: {
            VStack {
                Text("Custom Card")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            .background(isFocused ? Color.red : Color.green)
        }
      )
      .frame(maxWidth: .infinity)
      .frame(height: 100)
      .buttonStyle(.card)
      .focused($isFocused, equals: true)
      .onChange(of: isFocused) { newValue in
        isFocused = newValue
      }
    }
}

struct CustomCardButtonTV_Previews: PreviewProvider {
    static var previews: some View {
        CustomCardButtonTV()
    }
}
