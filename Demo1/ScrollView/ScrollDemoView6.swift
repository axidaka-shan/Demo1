//
//  ScrollDemoView6.swift
//  Demo1
//
//  Created by visit on 2023/6/2.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct ScrollDemoView6: View {
    var body: some View {
      ZStack {
        
        VStack {
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
      .ignoresSafeArea(.keyboard)
      .background(Color(.red))
    }
}

struct ScrollDemoView6_Previews: PreviewProvider {
    static var previews: some View {
        ScrollDemoView6()
    }
}
