//
//  ScrollDemoView4.swift
//  Demo1
//
//  Created by axidaka on 2023/3/29.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI


struct ScrollDemoView4: View {
  
  @Namespace var topID
  @Namespace var bottomID
  
    var body: some View {
      ScrollViewReader { proxy in
          ScrollView {
              Button("Scroll to Bottom") {
                  withAnimation {
                      proxy.scrollTo(bottomID)
                  }
              }
              .id(topID)

              VStack(spacing: 0) {
                  ForEach(0..<100) { i in
                      color(fraction: Double(i) / 100)
                          .frame(height: 32)
                  }
              }

              Button("Top") {
                  withAnimation {
                      proxy.scrollTo(topID)
                  }
              }
              .id(bottomID)
          }
      }
  }
  
  func color(fraction: Double) -> Color {
      Color(red: fraction, green: 1 - fraction, blue: 0.5)
  }
}

struct ScrollDemoView4_Previews: PreviewProvider {
    static var previews: some View {
        ScrollDemoView4()
    }
}
