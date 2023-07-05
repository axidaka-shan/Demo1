//
//  FocusScopeDemoView.swift
//  Demo1_tvOS
//
//  Created by visit on 2023/5/16.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct FocusScopeDemoView: View {
  @Namespace var mainNamespace
  @Environment(\.resetFocus) var resetFocus


  var body: some View {
      VStack {
          Button ("1") {}
          Button ("2") {}
          Button ("3") {}
              .prefersDefaultFocus(in: mainNamespace)
          Button ("Reset to default focus") {
              resetFocus(in: mainNamespace)
          }
      }
      .focusScope(mainNamespace)
  }
}

struct FocusScopeDemoView_Previews: PreviewProvider {
    static var previews: some View {
        FocusScopeDemoView()
    }
}
