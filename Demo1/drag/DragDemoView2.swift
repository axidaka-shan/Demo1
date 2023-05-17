//
//  DragDemoView2.swift
//  Demo1
//
//  Created by visit on 2023/5/16.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct DragDemoView2: View {
    var body: some View {
      VStack {
          ZStack {
              Text("DrawingGroup")
                  .foregroundColor(.black)
                  .padding(20)
                  .background(Color.red)
              Text("DrawingGroup")
                  .blur(radius: 2)
          }
          .font(.largeTitle)
          .compositingGroup()
          .opacity(1.0)
      }
       .background(Color.white)
       .drawingGroup()
    }
}

struct DragDemoView2_Previews: PreviewProvider {
    static var previews: some View {
        DragDemoView2()
    }
}
