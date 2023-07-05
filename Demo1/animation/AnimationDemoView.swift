//
//  AnimationDemoView.swift
//  Demo1
//
//  Created by visit on 2023/7/3.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

/**
 matchedGeometryEffect是SwiftUI中的一个特性，用于在不同视图之间创建动画效果。它可以在两个具有相同几何形状的视图之间创建一个平滑的过渡效果，使它们看起来像是同一个视图。

 */
struct AnimationDemoView: View {
  @Namespace private var namespace
  
  @State private var isExpanded = false
  
  var body: some View {
      VStack {
          if isExpanded {
              RoundedRectangle(cornerRadius: 25.0)
                  .matchedGeometryEffect(id: "shape", in: namespace)
                  .frame(width: 200, height: 200)
          } else {
              RoundedRectangle(cornerRadius: 10.0)
                  .matchedGeometryEffect(id: "shape", in: namespace)
                  .frame(width: 100, height: 100)
          }
          
          Button("Toggle") {
              withAnimation {
                  isExpanded.toggle()
              }
          }
      }
  }
}

struct AnimationDemoView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationDemoView()
    }
}

