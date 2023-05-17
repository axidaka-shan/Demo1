//
//  FocusSectionDemoView.swift
//  Demo1_tvOS
//
//  Created by visit on 2023/5/16.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct FocusSectionDemoView: View {
    var body: some View {
      HStack {
          VStack {
              Button ("1") {}
              Button ("2") {}
              Button ("3") {}
              Spacer()
          }
          .border(Color.white, width: 2)
//          .focusSection()

          Spacer()
          VStack {
              Spacer()
              Button ("A") {}

              Button ("B") {}

              Button ("C") {}
          }
          .border(Color.white, width: 2)
          .focusSection()

      }
  }
}

struct FocusSectionDemoView_Previews: PreviewProvider {
    static var previews: some View {
        FocusSectionDemoView()
    }
}
