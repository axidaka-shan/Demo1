//
//  FocusScopeDemoView.swift
//  Demo1_tvOS
//
//  Created by visit on 2023/5/16.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct FocusScopeDemoView: View {
  @Namespace private var namespace
  
  var body: some View {
      VStack {
        VStack {
          Text("Hello, world!")
          Button("Toggle") {
              withAnimation {
                  // Toggle some state variable
              }
          }
        }
        
        VStack {
          Text("Hello, world!2222")
              .matchedGeometryEffect(id: "text", in: namespace)
          
          Button("Toggle2222") {
              withAnimation {
                  // Toggle some state variable
              }
          }
          .focusScope(namespace)
        }
          
      }
  }
}

struct FocusScopeDemoView_Previews: PreviewProvider {
    static var previews: some View {
        FocusScopeDemoView()
    }
}
