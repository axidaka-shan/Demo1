//
//  StackDemo2View.swift
//  Demo1
//
//  Created by axidaka on 2023/3/17.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct StackDemo2View: View {
    var body: some View {
      HStack {
          Button("Left Button") {
              // Button action
          }
          Spacer()
          Text("Center Text")
              .font(.headline) // Set the font style and size
          Spacer()
          Image(systemName: "square.and.arrow.up")
              .resizable() // Make the image resizable
              .frame(width: 20, height: 20) // Set the size of the image
      }
      
      HStack {
          Button("Left Button") {
              // Button action
          }
        Spacer()

          Text("Center")
              .font(.headline) // Set the font style and size
        Spacer()
        Spacer()

      }

    }
}

struct StackDemo2View_Previews: PreviewProvider {
    static var previews: some View {
        StackDemo2View()
    }
}
