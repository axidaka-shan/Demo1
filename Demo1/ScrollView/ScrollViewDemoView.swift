//
//  ScrollViewDemoView.swift
//  Demo1
//
//  Created by visit on 2023/6/1.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct ScrollViewDemoView: View {
    var body: some View {
      GeometryReader { geometry in   // Get the geometry
        ScrollViewReader { _ in
          ScrollView(.vertical) {
              VStack {
                  Text("Form goes here")
//                      .frame(maxWidth: 300)   // Set your max width
              }
              .padding()
              .background(Color.yellow)
              .frame(width: geometry.size.width)  // Make the scroll view full-width
              .frame(minHeight: geometry.size.height) // Set the content’s min height to the parent
          }
          .background(Color.gray)
        }
      }
    }
}

struct ScrollViewDemoView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewDemoView()
    }
}
