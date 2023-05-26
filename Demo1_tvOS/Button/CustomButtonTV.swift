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

    var body: some View {
      
      Button("default button") {
        
      }
      .frame(maxWidth: .infinity)
      .frame(height: 100)
//      .background(isFocused ? Color.red : Color.green)
      .focused($isFocused, equals: true)
      .onChange(of: isFocused) { newValue in
        isFocused = newValue
      }
    }
}

struct CustomButtonTV_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonTV()
    }
}
