//
//  ShapeDemoView2.swift
//  Demo1
//
//  Created by visit on 2023/5/29.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct ShapeDemoView2: View {
    var body: some View {
      VStack {
          Rectangle()
              .fill(Color.black)
              .frame(width: 200, height: 200)
          
          RoundedRectangle(cornerRadius: 25, style: .continuous)
              .fill(Color.red)
              .frame(width: 200, height: 200)
          
          Capsule()
              .fill(Color.green)
              .frame(width: 100, height: 50)
          
          Ellipse()
              .fill(Color.blue)
              .frame(width: 100, height: 50)
          
          Circle()
              .fill(Color.gray)
              .frame(width: 100, height: 50)
      }

    }
}

struct ShapeDemoView2_Previews: PreviewProvider {
    static var previews: some View {
        ShapeDemoView2()
    }
}
